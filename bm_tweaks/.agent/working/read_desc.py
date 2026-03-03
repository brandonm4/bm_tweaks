import struct, os, re

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"
TLK_PATH = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/lang/en_US/dialog.tlk"

# --- TLK reader ---
with open(TLK_PATH, "rb") as f:
    tlk = f.read()
num_strs    = struct.unpack_from("<I", tlk, 0x0a)[0]
str_data_off = struct.unpack_from("<I", tlk, 0x0e)[0]

def tlk_str(strref):
    if strref is None or strref >= num_strs or strref == 0xffffffff:
        return None
    entry = 0x12 + strref * 0x1a
    flags = struct.unpack_from("<H", tlk, entry)[0]
    if not (flags & 1):
        return None
    off = struct.unpack_from("<I", tlk, entry + 0x12)[0]
    ln  = struct.unpack_from("<I", tlk, entry + 0x16)[0]
    return tlk[str_data_off + off : str_data_off + off + ln].decode('cp1252', errors='replace')

def find_spl(name):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + ".SPL":
            return os.path.join(OVERRIDE, fn)
    return None

# --- Find SPL header StrRef offsets empirically using SPWI601 ---
# Print every DWORD in the SPL global header that resolves to a non-trivial TLK string
print("=== Scanning SPWI601 header for StrRef offsets ===")
path = find_spl("SPWI601")
with open(path, "rb") as f:
    spl = f.read()
for off in range(0, 0x72, 4):
    val = struct.unpack_from("<I", spl, off)[0]
    txt = tlk_str(val)
    if txt and len(txt) > 20:
        print(f"  0x{off:02x}  StrRef={val:<8}  {txt[:80]!r}")

# --- Now dump descriptions for all patched spells ---
# We'll use the offsets we discover above; typically 0x08/0x0c = names, 0x50/0x54 = descs
# Common SPL V1 layout: 0x08 unid-name, 0x0c id-name, 0x50 unid-desc, 0x54 id-desc (BGEE)
NAME_OFF  = 0x08
INAME_OFF = 0x0c
DESC_OFF  = 0x50   # will confirm from scan above
IDESC_OFF = 0x54

SPELLS = [
    "SPWI107","SPWI216","SPWI309","SPWI407","SPWI423",
    "SPWI501","SPWI504","SPWI516","SPWI520","SPWI521","SPWI526",
    "SPWI601","SPWI610","SPWI619","SPWI620","SPWI621","SPWI622","SPWI624","SPWI633",
    "SPWI706","SPWI707","SPWI717","SPWI718","SPWI719",
    "SPWI801","SPWI802","SPWI806","SPWI807","SPWI905",
    "SPPR119","SPPR220","SPPR320","SPPR402","SPPR410",
    "SPPR501","SPPR602","SPPR605","SPPR617","SPPR618",
    "SPPR703","SPPR716","SPPR726","SPPR727",
    "SPWI505","SPPR301","SPPR619",
    "SPCL923","SPCL935",
]

# Regex: look for duration-like text
DUR_RE = re.compile(
    r'[Dd]uration[^.:\n]{0,5}[:\s]+([^\n.]+)',
    re.IGNORECASE
)

print("\n=== Duration lines in spell descriptions ===")
print(f"{'Spell':<12} {'StrRef':<8} {'Duration text found'}")
print("-" * 70)

for resref in SPELLS:
    path = find_spl(resref)
    if not path:
        print(f"{resref:<12} MISSING"); continue
    with open(path, "rb") as f:
        data = f.read()

    # Try both desc offsets; prefer identified (IDESC_OFF)
    strref = struct.unpack_from("<I", data, IDESC_OFF)[0]
    txt    = tlk_str(strref)
    if not txt:
        strref = struct.unpack_from("<I", data, DESC_OFF)[0]
        txt    = tlk_str(strref)

    if not txt:
        print(f"{resref:<12} {'—':<8}  (no description string)")
        continue

    matches = DUR_RE.findall(txt)
    if matches:
        for m in matches:
            print(f"{resref:<12} {strref:<8}  Duration: {m.strip()[:55]}")
    else:
        # show a short excerpt so we can see what's there
        excerpt = txt[:120].replace('\n', ' ')
        print(f"{resref:<12} {strref:<8}  (no 'Duration:' found) | {excerpt!r}")
