"""
spell_full_effect_dump.py
Dumps EVERY effect from specified SPL files — all opcodes, all fields.
Used to find where the actual in-game summon duration is stored.

Run from the game root:
    python3 bm_tweaks/staging/scripts/spell_full_effect_dump.py
"""

import struct
import os
import glob

TLK_PATH = 'lang/en_US/dialog.tlk'

# Spells to dump — start with Animate Dead variants and a known timed summon
TARGETS = [
    'SPPR301',    # Animate Dead (Priest)
    'SPPR619',    # Animate Skeleton Warrior (Priest)
    'SPWI501',    # Summon Shadow (Wizard)
    'SPWI707',    # Summon Death Knight (Wizard)
    'SPWI107',    # Monster Summoning I (Wizard) — baseline conjure
    'SPCL106',    # Animate Dead (innate)
    'BPLYKSUM',   # Animate Dead (innate variant)
]

# ---------------------------------------------------------------------------
# TLK
# ---------------------------------------------------------------------------
def load_tlk(path):
    with open(path, 'rb') as f:
        return f.read()

def tlk_str(tlk, strref):
    if strref < 0: return '(none)'
    n   = struct.unpack_from('<I', tlk, 0x0A)[0]
    off = struct.unpack_from('<I', tlk, 0x0E)[0]
    if strref >= n: return f'(OOB {strref})'
    e  = 0x12 + strref * 26
    to = struct.unpack_from('<I', tlk, e + 18)[0]
    tl = struct.unpack_from('<I', tlk, e + 22)[0]
    if not tl: return ''
    return tlk[off+to:off+to+tl].decode('cp1252', errors='replace').strip()

# ---------------------------------------------------------------------------
# SPL / effect parsing
# ---------------------------------------------------------------------------
FX_SIZE = 0x30

TIMING_NAMES = {
    0:  'Permanent',
    1:  'Instant/Timed (rounds)',
    2:  'Delay/Timed (rounds)',
    3:  'Delay/Permanent',
    4:  'Preset/Timed (rounds)',
    5:  'Preset/Permanent',
    6:  'Duration/Timed (rounds)',
    7:  'Perm_after_death',
    8:  'Perm_unsaved',
    9:  'Instant/Timed (turns)',
    10: 'Duration/Timed (turns)',
}

# Common opcodes relevant to summons
OPCODE_LABELS = {
    177: 'Create Creature',
    146: 'Cast Spell (target)',
    148: 'Cast Spell (self)',
    232: 'Summon Creature 2',
    187: 'Set Spell State',
    139: 'Prevent Death',
    321: 'Spell Effect: Damage',
     24: 'Luck',
    174: 'Transfer HP',
    263: 'Summon Monsters',
    264: 'Unsummon Creature',
    209: 'Timestop',
}

def read_spl(path):
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < 0x72 or data[0:4] != b'SPL ':
        return None
    return {
        'name_strref': struct.unpack_from('<i',  data, 0x08)[0],
        'spell_type':  struct.unpack_from('<H',  data, 0x1C)[0],
        'school':      data[0x25],
        'level':       data[0x29],
        'ext_off':     struct.unpack_from('<I',  data, 0x64)[0],
        'ext_cnt':     struct.unpack_from('<H',  data, 0x68)[0],
        'fx_off':      struct.unpack_from('<I',  data, 0x6A)[0],
        'fx_idx':      struct.unpack_from('<H',  data, 0x6E)[0],  # global fx index
        'fx_cnt':      struct.unpack_from('<H',  data, 0x70)[0],  # global fx count
        'data':        data,
    }

def read_effect(data, fx_off, abs_idx):
    base = fx_off + abs_idx * FX_SIZE
    if base + FX_SIZE > len(data):
        return None
    raw_res  = data[base + 0x14 : base + 0x14 + 8]
    resource = raw_res.rstrip(b'\x00').decode('ascii', errors='replace').upper()
    return {
        'opcode':   struct.unpack_from('<H', data, base + 0x00)[0],
        'target':   data[base + 0x02],
        'power':    data[base + 0x03],
        'param1':   struct.unpack_from('<I', data, base + 0x04)[0],
        'param2':   struct.unpack_from('<I', data, base + 0x08)[0],
        'timing':   data[base + 0x0C],
        'resist':   data[base + 0x0D],
        'duration': struct.unpack_from('<I', data, base + 0x0E)[0],
        'prob1':    data[base + 0x12],
        'prob2':    data[base + 0x13],
        'resource': resource,
        'dcount':   struct.unpack_from('<I', data, base + 0x1C)[0],
        'dsize':    struct.unpack_from('<I', data, base + 0x20)[0],
    }

def dump_effect(fx, label=''):
    timing_str = TIMING_NAMES.get(fx['timing'], f"?{fx['timing']}")
    op_name    = OPCODE_LABELS.get(fx['opcode'], '')
    res_str    = f"  res={fx['resource']}" if fx['resource'] else ''
    print(f"    {label}"
          f"op={fx['opcode']:>3} ({op_name:<22})  "
          f"p1={fx['param1']:<8} p2={fx['param2']:<8} "
          f"timing={fx['timing']:>2} ({timing_str:<28})  "
          f"dur={fx['duration']:<8}"
          f"{res_str}")

def dump_spl(resref, tlk):
    path = f'override/{resref}.SPL'
    if not os.path.exists(path):
        path = f'override/{resref}.spl'
    if not os.path.exists(path):
        print(f"\n[{resref}] NOT FOUND")
        return

    h    = read_spl(path)
    name = tlk_str(tlk, h['name_strref'])
    SCHOOLS = {0:'None',1:'Abjur',2:'Conjur',3:'Divin',4:'Enchant',
               5:'Illus',6:'Invoke',7:'Necro',8:'Trans',9:'General'}
    TYPES   = {1:'Wizard',2:'Priest',3:'Psionic',4:'Innate',5:'Bard'}

    print(f"\n{'='*80}")
    print(f"  {resref}  \"{name}\"")
    print(f"  type={TYPES.get(h['spell_type'],'?')}  "
          f"school={SCHOOLS.get(h['school'],'?')}  "
          f"level={h['level']}  "
          f"abilities={h['ext_cnt']}")
    print(f"{'='*80}")

    data   = h['data']
    fx_off = h['fx_off']

    # Global effects (applied at cast time regardless of ability used)
    if h['fx_cnt']:
        print(f"\n  -- Global Effects (idx {h['fx_idx']}, count {h['fx_cnt']}) --")
        for j in range(h['fx_cnt']):
            fx = read_effect(data, fx_off, h['fx_idx'] + j)
            if fx:
                dump_effect(fx, f'[global {j}] ')

    # Per-ability effects
    for i in range(h['ext_cnt']):
        base      = h['ext_off'] + i * 0x28
        ab_fx_idx = struct.unpack_from('<H', data, base + 0x20)[0]
        ab_fx_cnt = struct.unpack_from('<H', data, base + 0x22)[0]
        # Also read ability-level header fields for context
        ab_type   = data[base + 0x00]
        ab_loc    = data[base + 0x02]
        print(f"\n  -- Ability {i} (type={ab_type} loc={ab_loc}  "
              f"fx_idx={ab_fx_idx}  fx_cnt={ab_fx_cnt}) --")
        for j in range(ab_fx_cnt):
            fx = read_effect(data, fx_off, ab_fx_idx + j)
            if fx:
                dump_effect(fx, f'  [fx {j}] ')

def main():
    tlk = load_tlk(TLK_PATH)
    for resref in TARGETS:
        dump_spl(resref, tlk)
    print()

if __name__ == '__main__':
    main()
