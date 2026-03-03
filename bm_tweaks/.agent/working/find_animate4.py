import struct, os

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"
GAME     = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition"

def find_file(name, ext="spl"):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + "." + ext.upper():
            return os.path.join(OVERRIDE, fn)
    for root, dirs, files in os.walk(GAME):
        if "override" in root.lower(): continue
        for fn in files:
            if fn.upper() == name.upper() + "." + ext.upper():
                return os.path.join(root, fn)
    return None

def parse_spl(path):
    with open(path,"rb") as f: data = f.read()
    if data[0:4] != b"SPL ": return None, data
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    headers = []
    for i in range(abil_num):
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        efx = []
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            opc = struct.unpack_from("<H", data, fb)[0]
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            tim = data[fb + 0x0c]
            p1  = struct.unpack_from("<I", data, fb + 0x04)[0]
            p2  = struct.unpack_from("<I", data, fb + 0x08)[0]
            res = data[fb+0x14:fb+0x1c].rstrip(b'\x00').decode('latin-1')
            efx.append((opc,dur,tim,p1,p2,res))
        headers.append((min_lvl, efx))
    return headers, data

def summarize(resref):
    path = find_file(resref)
    if not path:
        print(f"  {resref}: NOT FOUND"); return
    hdrs, _ = parse_spl(path)
    if not hdrs: return
    src = "OVR" if "override" in path else "GAME"
    levels = [h[0] for h in hdrs]
    print(f"\n{resref} ({src}, {len(hdrs)} headers, levels={levels})")
    for i,(lvl,efx) in enumerate(hdrs):
        dur_efx = [(opc,dur,tim,res) for opc,dur,tim,p1,p2,res in efx if dur > 0]
        if dur_efx:
            for opc,dur,tim,res in dur_efx:
                tag = f"={dur//300}h{(dur%300)//60}m" if dur >= 300 else f"={dur}s"
                print(f"  hdr{i} lvl{lvl:>2}: op{opc:>3} dur={dur:>6}{tag:<8} tim={tim} res={res!r}")

for r in ["SPPR301", "SPPR619", "SPPR313", "SPPR313E",
          "SPWI505", "SPWI601", "SPWI801", "SPWI802"]:
    summarize(r)

# Also check for SPWI505D (the sub-spell referenced by SPWI505)
print("\n--- SPWI505D sub-spell check ---")
summarize("SPWI505D")
