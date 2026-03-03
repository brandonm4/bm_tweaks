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

def dump_all_effects(resref):
    path = find_spl(resref)
    if not path:
        print(f"  {resref}: NOT FOUND"); return
    with open(path,"rb") as f: data = f.read()
    if data[0:4] != b"SPL ": return
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    src = "OVR" if "override" in path else "GAME"
    print(f"\n{resref} ({src}, {abil_num} headers)")
    for i in range(abil_num):
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        print(f"  header {i}  min_level={min_lvl}  fx_cnt={fx_cnt}")
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            tim = data[fb + 0x0c]
            p1  = struct.unpack_from("<I", data, fb + 0x04)[0]
            p2  = struct.unpack_from("<I", data, fb + 0x08)[0]
            res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
            hours = f"={dur//300}h{(dur%300)//60}m" if dur >= 60 else ""
            print(f"    op={opc:>3}  dur={dur:>6}{hours:<8}  tim={tim}  p1={p1:<12}  p2={p2:<6}  res={res!r}")

# Full dump of the mystery/unconfirmed spells
for r in ["SPPR313", "SPPR303", "SPWI802"]:
    dump_all_effects(r)

# Check if there are priest Create Undead / Greater variants
print("\n\n--- Scanning for priest-side animate/create undead ---")
for fn in sorted(os.listdir(OVERRIDE)):
    if not fn.upper().endswith(".SPL"): continue
    if not fn.upper().startswith("SPPR"): continue
    path = os.path.join(OVERRIDE, fn)
    with open(path,"rb") as f: data = f.read()
    if data[0:4] != b"SPL ": continue
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    for i in range(abil_num):
        base   = abil_off + i * 0x28
        fx_idx = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt = struct.unpack_from("<H", data, base + 0x1e)[0]
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            if opc == 177 and dur >= 1800:
                res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
                print(f"  {fn.upper():<16} hdr{i}  op177  dur={dur} ({dur//300}h)  res={res!r}")
            if opc == 20 and dur >= 1800:
                res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
                print(f"  {fn.upper():<16} hdr{i}  op20   dur={dur} ({dur//300}h)  res={res!r}")
