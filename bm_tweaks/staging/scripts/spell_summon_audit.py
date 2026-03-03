"""
spell_summon_audit.py
Scans override/ for SPL files and identifies summoning-type spells
(Conjuration school = 2, Necromancy school = 7) by parsing the binary SPL header.
Also reads each ability block to find duration and duration_type.

Run from the game root:
    python3 bm_tweaks/staging/scripts/spell_summon_audit.py

SPL v1 format refs:
  https://gibberlings3.github.io/iesdp/file_formats/ie_formats/spl_v1.htm
"""

import struct
import os
import glob

# ---------------------------------------------------------------------------
# SPL header field offsets
# ---------------------------------------------------------------------------
OFF_SIG         = 0x00   # 4 bytes  "SPL "
OFF_VER         = 0x04   # 4 bytes  "V1  "
OFF_NAME        = 0x08   # 4 bytes  strref (identified name)
OFF_NAME2       = 0x0C   # 4 bytes  strref (unidentified name)
OFF_SPELL_TYPE  = 0x1C   # 2 bytes  1=Wizard 2=Priest 3=Psionic 4=Innate 5=Bard
OFF_SCHOOL      = 0x25   # 1 byte   primary school
OFF_SECTYPE     = 0x27   # 1 byte   secondary type
OFF_LEVEL       = 0x29   # 1 byte   spell level
OFF_EXT_OFF     = 0x64   # 4 bytes  offset to first ability (extended header)
OFF_EXT_CNT     = 0x68   # 2 bytes  number of abilities
OFF_FX_OFF      = 0x6A   # 4 bytes  offset to effects table (global)
OFF_FX_IDX      = 0x6E   # 2 bytes  index into effects for first global effect
OFF_FX_CNT      = 0x70   # 2 bytes  number of global effects

# ---------------------------------------------------------------------------
# Ability (Extended Header) field offsets  (each ability = 0x28 bytes)
# ---------------------------------------------------------------------------
ABIL_TYPE       = 0x00   # 1 byte   1=Melee 2=Ranged 3=Magical 4=Launcher
ABIL_LOCATION   = 0x02   # 1 byte   ability bar slot
ABIL_FX_IDX     = 0x20   # 2 bytes  index into effects table
ABIL_FX_CNT     = 0x22   # 2 bytes  number of effects for this ability

# ---------------------------------------------------------------------------
# Effect (FX) field offsets  (each effect = 0x30 bytes in EE, 0x30 in V2)
# But SPL effects embedded are 0x30 bytes (EE uses eff v2 embedded in spl)
# ---------------------------------------------------------------------------
FX_OPCODE       = 0x00   # 2 bytes
FX_DURATION     = 0x08   # 4 bytes  duration value
FX_DURTYPE      = 0x0C   # 1 byte   duration type (timing mode)
FX_SIZE         = 0x30   # 48 bytes each

# Opcode 177 = Create Creature (summon)
OPCODE_SUMMON   = 177

SPELL_TYPES = {1: 'Wizard', 2: 'Priest', 3: 'Psionic', 4: 'Innate', 5: 'Bard'}
SCHOOLS = {
    0: 'None',      1: 'Abjur',    2: 'Conjur',  3: 'Divin',
    4: 'Enchant',   5: 'Illus',    6: 'Invoke',  7: 'Necro',
    8: 'Trans',     9: 'General'
}
DUR_TYPES = {
    0:  'Instant/Permanent',
    1:  'Instant/Timed (rounds)',
    2:  'Delay/Timed (rounds)',
    3:  'Delay/Permanent',
    4:  'Preset/Timed (rounds)',
    5:  'Preset/Permanent',
    6:  'Duration/Timed (rounds)',
    7:  'Instant/Perm_after_death',
    8:  'Instant/Perm_unsaved',
    9:  'Instant/Timed (turns)',
    10: 'Duration/Timed (turns)',
}

# Summoning schools we care about
SUMMON_SCHOOLS = {2, 7}


def read_spl(path):
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < 0x72:
        return None
    if data[OFF_SIG:OFF_SIG+4] != b'SPL ':
        return None

    h = {
        'name_strref': struct.unpack_from('<i', data, OFF_NAME)[0],
        'spell_type':  struct.unpack_from('<H', data, OFF_SPELL_TYPE)[0],
        'school':      data[OFF_SCHOOL],
        'sec_type':    data[OFF_SECTYPE],
        'level':       data[OFF_LEVEL],
        'ext_off':     struct.unpack_from('<I', data, OFF_EXT_OFF)[0],
        'ext_cnt':     struct.unpack_from('<H', data, OFF_EXT_CNT)[0],
        'fx_off':      struct.unpack_from('<I', data, OFF_FX_OFF)[0],
        'data':        data,
    }
    return h


def read_abilities(h):
    data     = h['data']
    ext_off  = h['ext_off']
    ext_cnt  = h['ext_cnt']
    fx_off   = h['fx_off']
    abilities = []

    for i in range(ext_cnt):
        base = ext_off + i * 0x28
        if base + 0x28 > len(data):
            break
        ab_fx_idx = struct.unpack_from('<H', data, base + ABIL_FX_IDX)[0]
        ab_fx_cnt = struct.unpack_from('<H', data, base + ABIL_FX_CNT)[0]
        effects   = []
        for j in range(ab_fx_cnt):
            fx_base = fx_off + (ab_fx_idx + j) * FX_SIZE
            if fx_base + FX_SIZE > len(data):
                break
            opcode   = struct.unpack_from('<H', data, fx_base + FX_OPCODE)[0]
            duration = struct.unpack_from('<I', data, fx_base + FX_DURATION)[0]
            durtype  = data[fx_base + FX_DURTYPE]
            effects.append({'opcode': opcode, 'duration': duration, 'durtype': durtype})
        abilities.append(effects)
    return abilities


def summarise_durations(abilities):
    """Return a set of (duration, durtype_name) tuples found on summon effects."""
    seen = set()
    has_summon_opcode = False
    for fx_list in abilities:
        for fx in fx_list:
            if fx['opcode'] == OPCODE_SUMMON:
                has_summon_opcode = True
                dt_name = DUR_TYPES.get(fx['durtype'], f"?{fx['durtype']}")
                seen.add((fx['duration'], fx['durtype'], dt_name))
    return has_summon_opcode, seen


def main():
    results = []

    pattern = 'override/*.SPL'
    paths   = sorted(glob.glob(pattern) + glob.glob('override/*.spl'))

    for path in paths:
        h = read_spl(path)
        if not h:
            continue
        if h['school'] not in SUMMON_SCHOOLS:
            continue

        resref     = os.path.basename(path).upper().replace('.SPL', '')
        school_str = SCHOOLS.get(h['school'], f"?{h['school']}")
        type_str   = SPELL_TYPES.get(h['spell_type'], f"?{h['spell_type']}")
        level      = h['level']

        abilities = read_abilities(h)
        has_summon, dur_set = summarise_durations(abilities)

        results.append({
            'resref':     resref,
            'type':       type_str,
            'school':     school_str,
            'level':      level,
            'has_summon': has_summon,
            'durations':  sorted(dur_set),
        })

    # Sort by school, then type, then level, then resref
    results.sort(key=lambda r: (r['school'], r['type'], r['level'], r['resref']))

    # Print report
    print(f"{'RESREF':<16} {'TYPE':<8} {'SCHOOL':<8} {'LVL':<4} {'SUMMON_OP':<10}  DURATION(s)")
    print("-" * 90)
    for r in results:
        dur_str = '; '.join(
            f"{d}x {dn}" for (d, dt, dn) in r['durations']
        ) if r['durations'] else '(none / check manually)'
        summon_flag = 'YES' if r['has_summon'] else 'no-op177'
        print(f"{r['resref']:<16} {r['type']:<8} {r['school']:<8} {r['level']:<4} {summon_flag:<10}  {dur_str}")

    print()
    print(f"Total Conjur+Necro spells found: {len(results)}")
    summon_only = [r for r in results if r['has_summon']]
    print(f"Of those with opcode 177 (Create Creature): {len(summon_only)}")


if __name__ == '__main__':
    main()
