"""
spell_dispatch_audit.py
Examines the four *D sub-dispatch SPL files identified in the summon audit:
  SPWI106D, SPWI213D, SPWI313D, SPPR416D

For each:
  - Dumps all effects with full field detail (opcode, param1, param2,
    timing mode, actual duration at 0x0E, resource/creature resref)
  - Scans ALL override SPLs for any effect that references this resref
    via opcodes 146 or 148 (Cast Spell / Cast Spell on Self) to find the parent(s)

Note: The summon_audit2 script read offset 0x08 (Parameter 2) as "duration" —
this script corrects that and reads the real duration at offset 0x0E.

Run from the game root:
    python3 bm_tweaks/staging/scripts/spell_dispatch_audit.py
"""

import struct
import os
import glob

TLK_PATH = 'lang/en_US/dialog.tlk'

# ---------------------------------------------------------------------------
# TLK
# ---------------------------------------------------------------------------
def load_tlk(path):
    with open(path, 'rb') as f:
        return f.read()

def tlk_string(tlk_data, strref):
    if strref < 0:
        return '(none)'
    num_entries = struct.unpack_from('<I', tlk_data, 0x0A)[0]
    str_offset  = struct.unpack_from('<I', tlk_data, 0x0E)[0]
    if strref >= num_entries:
        return f'(strref {strref} OOB)'
    entry_base = 0x12 + strref * 26
    txt_off    = struct.unpack_from('<I', tlk_data, entry_base + 18)[0]
    txt_len    = struct.unpack_from('<I', tlk_data, entry_base + 22)[0]
    if txt_len == 0:
        return ''
    raw = tlk_data[str_offset + txt_off : str_offset + txt_off + txt_len]
    return raw.decode('cp1252', errors='replace').strip()

# ---------------------------------------------------------------------------
# SPL parsing
# ---------------------------------------------------------------------------
FX_SIZE = 0x30

# Embedded effect field offsets
EF_OPCODE   = 0x00   # 2  opcode
EF_TARGET   = 0x02   # 1  target
EF_POWER    = 0x03   # 1  power
EF_PARAM1   = 0x04   # 4  parameter 1
EF_PARAM2   = 0x08   # 4  parameter 2
EF_TIMING   = 0x0C   # 1  timing mode  (0=perm, 1=rounds, 9=turns, etc.)
EF_RESIST   = 0x0D   # 1  dispel/resistance
EF_DURATION = 0x0E   # 4  duration  ← the real duration value
EF_PROB1    = 0x12   # 1  probability 1
EF_PROB2    = 0x13   # 1  probability 2
EF_RESOURCE = 0x14   # 8  resource resref (creature for op177, spell for op146/148)
EF_DCOUNT   = 0x1C   # 4  dice count
EF_DSIZE    = 0x20   # 4  dice size
EF_SAVETYPE = 0x24   # 4  save type
EF_SAVEBONUS= 0x28   # 4  save bonus
EF_SPECIAL  = 0x2C   # 4  special

TIMING_NAMES = {
    0:  'Permanent',
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

# Opcodes of interest
OPCODE_CREATE_CREATURE = 177
OPCODE_CAST_SPELL      = 146   # cast spell at target
OPCODE_CAST_ON_SELF    = 148   # cast spell on caster

CAST_OPCODES = {OPCODE_CAST_SPELL, OPCODE_CAST_ON_SELF}


def read_spl_raw(path):
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < 0x72 or data[0:4] != b'SPL ':
        return None
    return {
        'path':        path,
        'name_strref': struct.unpack_from('<i', data, 0x08)[0],
        'spell_type':  struct.unpack_from('<H', data, 0x1C)[0],
        'school':      data[0x25],
        'level':       data[0x29],
        'ext_off':     struct.unpack_from('<I', data, 0x64)[0],
        'ext_cnt':     struct.unpack_from('<H', data, 0x68)[0],
        'fx_off':      struct.unpack_from('<I', data, 0x6A)[0],
        'data':        data,
    }


def read_effect(data, fx_off, abs_idx):
    base     = fx_off + abs_idx * FX_SIZE
    if base + FX_SIZE > len(data):
        return None
    raw_res  = data[base + EF_RESOURCE : base + EF_RESOURCE + 8]
    resource = raw_res.rstrip(b'\x00').decode('ascii', errors='replace').upper()
    return {
        'opcode':   struct.unpack_from('<H', data, base + EF_OPCODE)[0],
        'target':   data[base + EF_TARGET],
        'param1':   struct.unpack_from('<I', data, base + EF_PARAM1)[0],
        'param2':   struct.unpack_from('<I', data, base + EF_PARAM2)[0],
        'timing':   data[base + EF_TIMING],
        'duration': struct.unpack_from('<I', data, base + EF_DURATION)[0],
        'resource': resource,
    }


def get_all_effects(h):
    """Return list of (ability_idx, effect) for all effects in all abilities."""
    results = []
    data   = h['data']
    fx_off = h['fx_off']
    for i in range(h['ext_cnt']):
        base      = h['ext_off'] + i * 0x28
        ab_fx_idx = struct.unpack_from('<H', data, base + 0x20)[0]
        ab_fx_cnt = struct.unpack_from('<H', data, base + 0x22)[0]
        for j in range(ab_fx_cnt):
            fx = read_effect(data, fx_off, ab_fx_idx + j)
            if fx:
                results.append((i, fx))
    return results


# ---------------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------------
def main():
    tlk_data = load_tlk(TLK_PATH)

    targets = ['SPWI106D', 'SPWI213D', 'SPWI313D', 'SPPR416D']

    # ------------------------------------------------------------------
    # Step 1: Load and display the target *D files
    # ------------------------------------------------------------------
    print("=" * 80)
    print("STEP 1 — Detailed effect dump of *D sub-dispatch files")
    print("=" * 80)

    for resref in targets:
        path = f'override/{resref}.SPL'
        if not os.path.exists(path):
            path = f'override/{resref}.spl'
        if not os.path.exists(path):
            print(f"\n[{resref}] NOT FOUND in override/")
            continue

        h    = read_spl_raw(path)
        name = tlk_string(tlk_data, h['name_strref']) if h else '(unreadable)'
        print(f"\n[{resref}]  name strref={h['name_strref']}  \"{name}\"")
        print(f"  type={h['spell_type']}  school={h['school']}  level={h['level']}")
        print(f"  abilities={h['ext_cnt']}  fx_offset=0x{h['fx_off']:X}")
        print()

        for ab_idx, fx in get_all_effects(h):
            timing_name = TIMING_NAMES.get(fx['timing'], f"?{fx['timing']}")
            op_label = ''
            if fx['opcode'] == OPCODE_CREATE_CREATURE:
                op_label = '<<< CREATE CREATURE'
            elif fx['opcode'] in CAST_OPCODES:
                op_label = '<<< CAST SPELL'
            print(f"  [abil {ab_idx}] op={fx['opcode']:>3}  "
                  f"p1={fx['param1']:<6}  p2={fx['param2']:<6}  "
                  f"timing={fx['timing']} ({timing_name})  "
                  f"dur={fx['duration']:<6}  "
                  f"res={fx['resource'] or '(none)':<12}  {op_label}")

    # ------------------------------------------------------------------
    # Step 2: Scan all override SPLs for references to the target resrefs
    # ------------------------------------------------------------------
    print()
    print("=" * 80)
    print("STEP 2 — Scanning override/ for parent spells that call these resrefs")
    print("         (opcodes 146 = Cast Spell, 148 = Cast Spell on Self)")
    print("=" * 80)

    target_set = set(targets)
    parents    = {t: [] for t in targets}

    all_paths = sorted(glob.glob('override/*.SPL') + glob.glob('override/*.spl'))

    for path in all_paths:
        h = read_spl_raw(path)
        if not h:
            continue
        caller = os.path.basename(path).upper().replace('.SPL', '')

        for ab_idx, fx in get_all_effects(h):
            if fx['opcode'] in CAST_OPCODES and fx['resource'] in target_set:
                name      = tlk_string(tlk_data, h['name_strref'])
                parents[fx['resource']].append({
                    'caller':   caller,
                    'name':     name,
                    'ability':  ab_idx,
                    'opcode':   fx['opcode'],
                    'param1':   fx['param1'],
                    'param2':   fx['param2'],
                    'timing':   fx['timing'],
                    'duration': fx['duration'],
                })

    for resref in targets:
        print(f"\n  Callers of {resref}:")
        if not parents[resref]:
            print("    (none found — may be called via script or creature AI)")
        for p in sorted(parents[resref], key=lambda x: x['caller']):
            timing_name = TIMING_NAMES.get(p['timing'], f"?{p['timing']}")
            print(f"    {p['caller']:<16}  \"{p['name']}\"")
            print(f"      ability={p['ability']}  op={p['opcode']}  "
                  f"timing={p['timing']} ({timing_name})  dur={p['duration']}")


if __name__ == '__main__':
    main()
