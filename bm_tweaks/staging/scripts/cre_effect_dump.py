"""
cre_effect_dump.py
Reads CRE and EFF files for summoned creatures and dumps their applied effects.
Some summon targets exist only as standalone EFF V2.0 files; others are CRE V1.0.

Key findings:
  CRE V1.0 effect section pointers are at 0x2C4 (offset) and 0x2C8 (count),
  NOT at 0x0108/0x010C (which are the memorised-spell table pointers).
  EFF V2.0 files hold a single effect whose data begins at file offset 0x10.

Run from the game root:
    python3 bm_tweaks/staging/scripts/cre_effect_dump.py
"""

import struct
import os

TLK_PATH = 'lang/en_US/dialog.tlk'

# CRE files (or EFF files) for the summoned creatures we care about
TARGETS = [
    # Animate Dead creatures
    'SPANDEAD',   # SPPR301 abilities 0-2  (EFF V2.0)
    'SPANDL12',   # SPPR301 ability 3      (EFF V2.0)
    'SPANDE01',   # SPCL106 ability 0      (EFF V2.0)
    'SPANDE07',   # SPCL106 ability 1      (EFF V2.0)
    'SPANDE11',   # SPCL106 ability 2      (EFF V2.0)
    'SPANDL15',   # SPPR619 / SPCL106 ability 3 (EFF V2.0)
    # Other summoned creatures
    'SHADOWSU',   # SPWI501 Summon Shadow  (CRE V1.0)
    'DVWRAITH',   # SPWI501 Summon Shadow alt (EFF V2.0 + CRE V1.0)
    'SPCACO',     # SPWI707 Summon Death Knight (EFF V2.0)
    'GIBBERSU',   # SPWI107 Monster Summoning I (CRE V1.0)
    'BPLLYRK',    # BPLYKSUM Animate Dead (innate) (CRE V1.0)
]

# ---------------------------------------------------------------------------
# TLK
# ---------------------------------------------------------------------------
def load_tlk(path):
    with open(path, 'rb') as f:
        return f.read()

def tlk_str(tlk, strref):
    if strref < 0:
        return '(none)'
    n   = struct.unpack_from('<I', tlk, 0x0A)[0]
    off = struct.unpack_from('<I', tlk, 0x0E)[0]
    if strref >= n:
        return f'(OOB {strref})'
    e  = 0x12 + strref * 26
    to = struct.unpack_from('<I', tlk, e + 18)[0]
    tl = struct.unpack_from('<I', tlk, e + 22)[0]
    if not tl:
        return ''
    return tlk[off+to:off+to+tl].decode('cp1252', errors='replace').strip()

# ---------------------------------------------------------------------------
# CRE V1.0 parsing
#
# The fixed header is 0x2D4 bytes.  Effect section pointers:
#   0x0000  4  Signature "CRE "
#   0x0004  4  Version   "V1.0"
#   0x0008  4  Long name strref
#   0x000C  4  Short name strref
#   0x02C4  4  Offset to applied effects   <-- NOT 0x0108
#   0x02C8  4  Count of applied effects    <-- NOT 0x010C
#
# EFF V2.0 parsing
# A standalone single-effect file; effect payload begins at 0x10:
#   0x0000  4  Signature "EFF "
#   0x0004  4  Version   "V2.0"
#   0x0010  4  Opcode
#   0x0014  4  Target
#   0x0018  4  Timing mode
#   0x001C  4  Parameter 1
#   0x0020  4  Parameter 2
#   0x0024  1  Probability 1
#   0x0025  1  Probability 2
#   0x0028  4  Duration (seconds)
#   0x0030  8  Resource resref
# ---------------------------------------------------------------------------
FX_SIZE   = 0x30   # size of one inline effect record inside a CRE V1.0
EFF2_BASE = 0x10   # byte offset where effect payload starts in an EFF V2.0

TIMING_NAMES = {
    0:  'Duration (seconds)',
    1:  'Instant/Permanent',
    2:  'Delay/Timed (seconds)',
    3:  'Delay/Permanent',
    4:  'Preset/Timed (seconds)',
    5:  'Preset/Permanent',
    6:  'Duration/Timed (seconds)',
    7:  'Perm_after_death',
    8:  'Perm_unsaved',
    9:  'Instant/Timed (turns)',
    10: 'Duration/Timed (turns)',
}

OPCODE_LABELS = {
      1: 'AC Modifier',
      2: 'Attack Modifier',
     12: 'Damage',
     31: 'Cure Disease',
     39: 'Sleep',
     67: 'Unsummon Creature',
    101: 'Protection from Evil',
    109: 'Paralyze',
    139: 'Prevent Death',
    146: 'Cast Spell (target)',
    148: 'Cast Spell (self)',
    174: 'Transfer HP',
    177: 'Create Creature',
    215: 'Disable Button',
    216: 'Enable Button',
    232: 'Summon Creature 2',
    264: 'Unsummon Creature',
    321: 'Remove Spell',
    324: 'Summon Creature 3',
}


def read_cre(path):
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < 0x2D0:
        return None
    if data[0:4] != b'CRE ':
        return None
    ver = data[4:8].decode('ascii', errors='replace').strip()
    return {
        'version':      ver,
        'name_strref':  struct.unpack_from('<i', data, 0x08)[0],
        'sname_strref': struct.unpack_from('<i', data, 0x0C)[0],
        # CRE V1.0: effect section pointers are at 0x2C4 / 0x2C8
        'fx_off':       struct.unpack_from('<I', data, 0x2C4)[0],
        'fx_cnt':       struct.unpack_from('<I', data, 0x2C8)[0],
        'data':         data,
    }


def read_eff2(path):
    """Read a standalone EFF V2.0 file and return a single effect dict."""
    with open(path, 'rb') as f:
        data = f.read()
    if len(data) < EFF2_BASE + 0x30:
        return None
    if data[0:4] != b'EFF ' or data[4:8] != b'V2.0':
        return None
    b = EFF2_BASE
    raw_res  = data[b + 0x20 : b + 0x28]
    resource = raw_res.rstrip(b'\x00').decode('ascii', errors='replace').upper()
    return {
        'opcode':   struct.unpack_from('<I', data, b + 0x00)[0],
        'target':   struct.unpack_from('<I', data, b + 0x04)[0],
        'timing':   struct.unpack_from('<I', data, b + 0x08)[0],
        'param1':   struct.unpack_from('<I', data, b + 0x0C)[0],
        'param2':   struct.unpack_from('<I', data, b + 0x10)[0],
        'prob1':    data[b + 0x14],
        'prob2':    data[b + 0x15],
        'duration': struct.unpack_from('<I', data, b + 0x18)[0],
        'resource': resource,
        'power':    0,
        'resist':   0,
        'dcount':   0,
        'dsize':    0,
    }


def read_effect(data, base):
    """Read one inline effect record from a CRE V1.0 applied-effects section."""
    if base + FX_SIZE > len(data):
        return None
    raw_res  = data[base + 0x14 : base + 0x1C]
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


def seconds_to_human(secs):
    if secs == 0:
        return '0'
    rounds = secs / 6
    turns  = secs / 60
    hours  = secs / 3600
    if hours >= 1:
        return f'{secs}s = {rounds:.0f} rounds = {turns:.0f} turns = {hours:.2f} hrs'
    elif turns >= 1:
        return f'{secs}s = {rounds:.0f} rounds = {turns:.1f} turns'
    else:
        return f'{secs}s = {rounds:.1f} rounds'


def _print_fx(i, fx):
    timing_str = TIMING_NAMES.get(fx['timing'], f"?{fx['timing']}")
    op_name    = OPCODE_LABELS.get(fx['opcode'], '')
    res_str    = f"  res='{fx['resource']}'" if fx['resource'] else ''
    dur_human  = f'  [{seconds_to_human(fx["duration"])}]' if fx['duration'] > 0 else ''
    label      = f'[fx {i:>2}]' if i >= 0 else '[eff]  '
    print(f"  {label}  op={fx['opcode']:>3} ({op_name:<22})"
          f"  p1={fx['param1']:<8}  p2={fx['param2']:<8}"
          f"  timing={fx['timing']:>2} ({timing_str:<26})"
          f"  dur={fx['duration']:<8}"
          f"{res_str}{dur_human}")


def dump_resref(resref, tlk):
    """Try CRE first, then fall back to EFF V2.0."""

    # --- try CRE ---
    for ext in ('.CRE', '.cre'):
        cre_path = f'override/{resref}{ext}'
        if os.path.exists(cre_path):
            h = read_cre(cre_path)
            if not h:
                print(f'\n[{resref}] Could not parse CRE at {cre_path}')
                return
            name  = tlk_str(tlk, h['name_strref'])
            sname = tlk_str(tlk, h['sname_strref'])
            print(f'\n{"="*80}')
            print(f'  {resref}  (CRE {h["version"]})')
            print(f'  Long name:  "{name}"')
            print(f'  Short name: "{sname}"')
            print(f'  Applied effects: {h["fx_cnt"]}  (at offset 0x{h["fx_off"]:X})')
            print(f'{"="*80}')
            if h['fx_cnt'] == 0:
                print('  (no applied effects)')
                return
            for i in range(h['fx_cnt']):
                base = h['fx_off'] + i * FX_SIZE
                fx   = read_effect(h['data'], base)
                if not fx:
                    print(f'  [fx {i}] (read error at 0x{base:X})')
                    continue
                _print_fx(i, fx)
            return

    # --- try EFF V2.0 ---
    for ext in ('.eff', '.EFF'):
        eff_path = f'override/{resref}{ext}'
        if os.path.exists(eff_path):
            fx = read_eff2(eff_path)
            if not fx:
                print(f'\n[{resref}] Could not parse EFF at {eff_path}')
                return
            print(f'\n{"="*80}')
            print(f'  {resref}  (EFF V2.0  standalone)')
            print(f'{"="*80}')
            _print_fx(-1, fx)
            return

    print(f'\n[{resref}] NOT FOUND in override/ (tried .CRE/.cre/.eff/.EFF)')


def main():
    tlk = load_tlk(TLK_PATH)
    for resref in TARGETS:
        dump_resref(resref, tlk)
    print()

if __name__ == '__main__':
    main()
