import struct, os

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"
GAME     = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition"

def find_spl(name):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + ".SPL":
            return os.path.join(OVERRIDE, fn)
    for root, dirs, files in os.walk(GAME):
        if "override" in root.lower():
            continue
        for fn in files:
            if fn.upper() == name.upper() + ".SPL":
                return os.path.join(root, fn)
    return None

def parse_spl_full(path):
    with open(path, "rb") as f:
        data = f.read()
    if data[0:4] != b"SPL ": return None
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    headers  = []
    for i in range(abil_num):
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        effects = []
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
            effects.append((opc, dur, res))
        headers.append((min_lvl, effects))
    return headers

# Key findings summary
spells = {
    "SPWI505": {"desc": "Animate Dead (Wiz 5)",   "note": "SR: already has per-level blocks! Uses op20+op174 for duration (NOT op177)"},
    "SPWI601": {"desc": "Create Undead (Wiz 6)",   "note": "single block, flat 2400s (8h), op177->SPSTALK"},
    "SPWI801": {"desc": "Create Greater Undead (Wiz 8)", "note": "has 5 blocks (fallback+17-20), all-effect durations, NO op177"},
    "SPWI802": {"desc": "Create Greater Undead variant?", "note": "single block 54 fx, all 2400s, no op177 - CR-type spell?"},
    "SPPR313": {"desc": "Animate Dead (Priest 3)", "note": "single block, check for op177 or other dur opcode"},
    "SPPR303": {"desc": "Animate Dead (Priest 3 alt?)", "note": "single block, op177 dur=0 DESTSELF"},
}

for resref, info in spells.items():
    path = find_spl(resref)
    if not path:
        print(f"{resref}: NOT FOUND"); continue
    hdrs = parse_spl_full(path)
    src = "(OVR)" if "override" in path else "(GAME)"
    levels = [h[0] for h in hdrs]
    # find the duration-bearing opcodes: op20, op174(timing=4), op177
    print(f"\n{resref} {src}  {info['desc']}")
    print(f"  headers: {len(hdrs)}, levels: {levels}")
    for i,(lvl,efx) in enumerate(hdrs):
        dur_efx = [(opc,dur,res) for opc,dur,res in efx
                   if opc in (20,177) or (opc==174 and dur>0)]
        if dur_efx:
            for opc,dur,res in dur_efx:
                hours = dur/300
                print(f"  hdr{i} lvl{lvl:>2}: op{opc:>3}  dur={dur:>6}  ({hours:.2f}h)  res={res!r}")
