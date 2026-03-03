import struct, os, re

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

def parse_spl(path):
    with open(path, "rb") as f:
        data = f.read()
    if data[0:4] != b"SPL ":
        return None
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    headers  = []
    for i in range(abil_num):
        base   = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        op177s  = []
        for j in range(fx_cnt):
            fb = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            if opc == 177:
                dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
                res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
                op177s.append((dur, res))
        headers.append((min_lvl, op177s))
    return headers

# Candidate resrefs: standard BG2 animate / create undead spells
# plus common Spell Revisions alternates
CANDIDATES = [
    # Animate Dead
    "SPWI505", "SPPR303", "SPPR313",
    # Create Undead
    "SPWI601", "SPWI602",
    # Create Greater Undead
    "SPWI801", "SPWI802",
    # Spell Revisions variants sometimes use these
    "SPWI505A", "SPPR313A",
    # Unholy Blight / Undead variants
    "SPWI507", "SPPR511",
]

print(f"{'Resref':<12} {'Hdrs':>4}  {'Levels present':<35}  op-177 durations (per header)")
print("-" * 90)
for r in CANDIDATES:
    path = find_spl(r)
    if not path:
        continue
    hdrs = parse_spl(path)
    if not hdrs:
        continue
    levels = [h[0] for h in hdrs]
    dur_info = []
    for (lvl, op177s) in hdrs:
        if op177s:
            durs = ", ".join(f"{d}s({d//300}h{(d%300)//60}m)" for d,_ in op177s)
            res  = "/".join(r for _,r in op177s)
            dur_info.append(f"[lvl{lvl}: {durs} -> {res}]")
    src = "(override)" if "override" in path else "(game data)"
    print(f"{r:<12} {len(hdrs):>4}  {str(levels):<35}  {src}")
    for d in dur_info:
        print(f"{'':>52}  {d}")

# Deeper scan: show ALL op-177 durations for the interesting ones
print("\n--- Detailed dump of spells with op-177 effects ---")
for r in ["SPWI505", "SPWI601", "SPWI801", "SPPR313", "SPWI602", "SPWI802"]:
    path = find_spl(r)
    if not path:
        print(f"{r}: NOT FOUND"); continue
    with open(path,"rb") as f: data = f.read()
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    print(f"\n{r}  ({abil_num} headers, from {path.split('/')[-2]})")
    for i in range(abil_num):
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        print(f"  header {i}: min_level={min_lvl}, fx_cnt={fx_cnt}")
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            p1  = struct.unpack_from("<I", data, fb + 0x04)[0]
            p2  = struct.unpack_from("<I", data, fb + 0x08)[0]
            tim = data[fb + 0x0c]
            res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
            print(f"    op={opc:>3}  dur={dur:>6}  timing={tim}  p1={p1}  p2={p2}  res={res!r}")
