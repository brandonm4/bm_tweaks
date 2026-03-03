"""
spell_summon_audit2.py
Deeper audit of summoning spells in override/.
- Reads dialog.tlk to resolve spell names from strrefs
- Filters to only spells with opcode 177 (Create Creature / summon)
- Shows resref, name, type, school, spell level, and duration info per ability
- Skips pure sub-files (ending in D/E/A/B/C suffix patterns) unless they ARE
  the canonical file (e.g. SPWI313D is the actual animate dead dispatch file)

Run from the game root:
    python3 bm_tweaks/staging/scripts/spell_summon_audit2.py

Output saved to: bm_tweaks/staging/reports/summon_spell_audit.md
"""

import struct
import os
import glob

# ---------------------------------------------------------------------------
# TLK reader
# ---------------------------------------------------------------------------
TLK_PATH = 'lang/en_US/dialog.tlk'

def read_tlk_string(tlk_data, strref):
    if strref < 0:
        return '(none)'
    # TLK header: sig(4) ver(4) lang(2) entries(4) offset(4)
    num_entries = struct.unpack_from('<I', tlk_data, 0x0A)[0]
    str_offset  = struct.unpack_from('<I', tlk_data, 0x0E)[0]
    if strref >= num_entries:
        return f'(strref {strref} OOB)'
    # Each entry = 26 bytes
    entry_base = 0x12 + strref * 26
    flags      = struct.unpack_from('<H', tlk_data, entry_base)[0]
    txt_off    = struct.unpack_from('<I', tlk_data, entry_base + 18)[0]
    txt_len    = struct.unpack_from('<I', tlk_data, entry_base + 22)[0]
    if txt_len == 0:
        return ''
    abs_off = str_offset + txt_off
    raw = tlk_data[abs_off:abs_off + txt_len]
    return raw.decode('cp1252', errors='replace').strip()

# ---------------------------------------------------------------------------
# SPL constants
# ---------------------------------------------------------------------------
SPELL_TYPES = {1: 'Wizard', 2: 'Priest', 3: 'Psionic', 4: 'Innate', 5: 'Bard'}
SCHOOLS = {
    0: 'None',    1: 'Abjur',   2: 'Conjur',  3: 'Divin',
    4: 'Enchant', 5: 'Illus',   6: 'Invoke',  7: 'Necro',
    8: 'Trans',   9: 'General'
}
DUR_TYPES = {
    0:  'Instant/Permanent',
    1:  'Instant/Timed (rounds)',
    2:  'Delay/Timed (rounds)',
    3:  'Delay/Permanent',
    4:  'Preset/Timed (rounds)',
    6:  'Duration/Timed (rounds)',
    9:  'Instant/Timed (turns)',
    10: 'Duration/Timed (turns)',
}

SUMMON_SCHOOLS = {2, 7}
OPCODE_SUMMON  = 177
FX_SIZE        = 0x30


def read_spl(path):
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < 0x72 or data[0:4] != b'SPL ':
        return None
    return {
        'name_strref': struct.unpack_from('<i', data, 0x08)[0],
        'spell_type':  struct.unpack_from('<H', data, 0x1C)[0],
        'school':      data[0x25],
        'level':       data[0x29],
        'ext_off':     struct.unpack_from('<I', data, 0x64)[0],
        'ext_cnt':     struct.unpack_from('<H', data, 0x68)[0],
        'fx_off':      struct.unpack_from('<I', data, 0x6A)[0],
        'data':        data,
    }


def get_summon_durations(h):
    """
    Walk every ability's effect list. Return list of dicts describing
    each opcode-177 effect found (which ability index, duration, durtype).
    """
    data    = h['data']
    fx_off  = h['fx_off']
    results = []

    for i in range(h['ext_cnt']):
        base      = h['ext_off'] + i * 0x28
        ab_fx_idx = struct.unpack_from('<H', data, base + 0x20)[0]
        ab_fx_cnt = struct.unpack_from('<H', data, base + 0x22)[0]
        for j in range(ab_fx_cnt):
            fx_base  = fx_off + (ab_fx_idx + j) * FX_SIZE
            if fx_base + FX_SIZE > len(data):
                break
            opcode   = struct.unpack_from('<H', data, fx_base)[0]
            duration = struct.unpack_from('<I', data, fx_base + 0x08)[0]
            durtype  = data[fx_base + 0x0C]
            if opcode == OPCODE_SUMMON:
                dt_name = DUR_TYPES.get(durtype, f'?type{durtype}')
                results.append({
                    'ability_idx': i,
                    'duration':    duration,
                    'durtype':     durtype,
                    'durtype_name': dt_name,
                })
    return results


def main():
    print("Loading dialog.tlk …")
    with open(TLK_PATH, 'rb') as f:
        tlk_data = f.read()

    paths = sorted(glob.glob('override/*.SPL') + glob.glob('override/*.spl'))
    results = []

    for path in paths:
        h = read_spl(path)
        if not h or h['school'] not in SUMMON_SCHOOLS:
            continue

        summon_fx = get_summon_durations(h)
        if not summon_fx:
            continue   # skip spells with no actual create-creature effect

        resref     = os.path.basename(path).upper().replace('.SPL', '')
        name       = read_tlk_string(tlk_data, h['name_strref'])
        school_str = SCHOOLS.get(h['school'], f"?{h['school']}")
        type_str   = SPELL_TYPES.get(h['spell_type'], f"?{h['spell_type']}")
        level      = h['level']

        # Collect unique (duration, durtype) pairs
        dur_summary = {}
        for fx in summon_fx:
            key = (fx['duration'], fx['durtype'])
            if key not in dur_summary:
                dur_summary[key] = fx['durtype_name']

        results.append({
            'resref':   resref,
            'name':     name,
            'type':     type_str,
            'school':   school_str,
            'level':    level,
            'fx':       summon_fx,
            'dur_summary': dur_summary,
        })

    # Sort by type, school, level, resref
    results.sort(key=lambda r: (r['type'], r['school'], r['level'], r['resref']))

    # -----------------------------------------------------------------------
    # Console summary
    # -----------------------------------------------------------------------
    print()
    print(f"{'RESREF':<16} {'LVL':<4} {'TYPE':<8} {'SCH':<8}  {'DURATION(S)':<35}  SPELL NAME")
    print("-" * 110)
    for r in results:
        dur_parts = [f"{d}x {dn}" for (d, dt), dn in r['dur_summary'].items()]
        dur_str   = ' | '.join(dur_parts)
        print(f"{r['resref']:<16} {r['level']:<4} {r['type']:<8} {r['school']:<8}  {dur_str:<35}  {r['name']}")

    # -----------------------------------------------------------------------
    # Markdown report
    # -----------------------------------------------------------------------
    os.makedirs('bm_tweaks/staging/reports', exist_ok=True)
    report_path = 'bm_tweaks/staging/reports/summon_spell_audit.md'
    with open(report_path, 'w') as f:
        f.write("# Summoning Spell Audit\n\n")
        f.write("Spells in `override/` with school=Conjuration or Necromancy **and** opcode 177 (Create Creature).\n\n")
        f.write(f"Total: **{len(results)}** spells\n\n")

        for type_label in ['Wizard', 'Priest', 'Innate', 'Bard', 'Psionic']:
            group = [r for r in results if r['type'] == type_label]
            if not group:
                continue
            f.write(f"## {type_label} Spells\n\n")
            f.write(f"| RESREF | Lvl | School | Duration(s) | Spell Name |\n")
            f.write(f"|--------|-----|--------|-------------|------------|\n")
            for r in group:
                dur_parts = [f"{d}x {dn}" for (d, dt), dn in r['dur_summary'].items()]
                dur_str   = ' / '.join(dur_parts)
                f.write(f"| {r['resref']} | {r['level']} | {r['school']} | {dur_str} | {r['name']} |\n")
            f.write("\n")

    print()
    print(f"Total summoning spells with opcode 177: {len(results)}")
    print(f"Report saved to: {report_path}")


if __name__ == '__main__':
    main()
