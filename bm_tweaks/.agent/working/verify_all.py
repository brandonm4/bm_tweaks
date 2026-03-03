import struct, os, re

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"

# ---------------------------------------------------------------------------
# Expected minimum caster level by spell type + level digit in filename.
# Formula: 2 * spell_level - 1  (same for wizard and priest)
#   L1->1, L2->3, L3->5, L4->7, L5->9, L6->11, L7->13, L8->15, L9->17
# ---------------------------------------------------------------------------
def expected_min_from_name(resref):
    m = re.match(r'^SP(WI|PR)(\d)', resref.upper())
    if m:
        return 2 * int(m.group(2)) - 1
    return None  # SPCL or unknown

# ---------------------------------------------------------------------------
# All patched spells:
#   key   = resref
#   value = (multiplier, explicit_true_min or None)
#           multiplier 60  = component 08 (1 turn/level)
#           multiplier 300 = component 09 (1 hour/level)
#           explicit_true_min overrides the filename-derived value when set
# ---------------------------------------------------------------------------
SPELLS = {
    # --- component 08 (× 60) ---
    "SPWI107": (60,  None),
    "SPWI216": (60,  None),
    "SPWI309": (60,  None),
    "SPWI407": (60,  None),
    "SPWI423": (60,  None),
    "SPWI501": (60,  None),
    "SPWI504": (60,  None),
    "SPWI516": (60,  None),
    "SPWI520": (60,  None),
    "SPWI521": (60,  None),
    "SPWI526": (60,  None),
    "SPWI610": (60,  None),
    "SPWI619": (60,  None),
    "SPWI620": (60,  None),
    "SPWI621": (60,  None),
    "SPWI622": (60,  None),
    "SPWI624": (60,  None),
    "SPWI633": (60,  None),
    "SPWI706": (60,  None),
    "SPWI707": (60,  13),
    "SPWI717": (60,  None),
    "SPWI718": (60,  None),
    "SPWI719": (60,  None),
    "SPWI806": (60,  None),
    "SPWI807": (60,  15),
    "SPWI905": (60,  17),
    "SPPR119": (60,  None),
    "SPPR220": (60,  None),
    "SPPR320": (60,  None),
    "SPPR402": (60,  None),
    "SPPR410": (60,  None),
    "SPPR501": (60,  None),
    "SPPR602": (60,  None),
    "SPPR605": (60,  None),
    "SPPR617": (60,  None),
    "SPPR618": (60,  None),
    "SPPR703": (60,  13),
    "SPPR716": (60,  13),
    "SPPR726": (60,  20),
    "SPPR727": (60,  20),
    "SPCL923": (60,  None),
    "SPCL935": (60,  None),
    # --- component 09 (× 300) ---
    "SPWI505": (300, None),   # 5th level wiz → expected 9; SR inferred 10
    "SPWI601": (300, 11),
    "SPWI801": (300, 15),
    "SPWI802": (300, 15),
    "SPPR301": (300, 5),
    "SPPR619": (300, 11),
}

# ---------------------------------------------------------------------------
def find_spl(name):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + ".SPL":
            return os.path.join(OVERRIDE, fn)
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
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        real_durs = []
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            if dur > 30:
                real_durs.append(dur)
        headers.append((min_lvl, real_durs))
    return headers

# ---------------------------------------------------------------------------
PASS = FAIL = WARN = 0
issues = []

for resref, (mult, explicit_min) in sorted(SPELLS.items()):
    path = find_spl(resref)
    if not path:
        print(f"  MISSING  {resref}")
        FAIL += 1; continue

    hdrs = parse_spl(path)
    if not hdrs:
        print(f"  PARSE ERR {resref}")
        FAIL += 1; continue

    # Determine expected true_min
    name_min     = expected_min_from_name(resref)
    expected     = explicit_min if explicit_min is not None else name_min
    # What's actually in the file (first non-fallback block)
    non_fallback = sorted(h[0] for h in hdrs if h[0] > 1)
    installed    = non_fallback[0] if non_fallback else None

    problems = []
    warnings = []

    # 1. Fallback block (min_level <= 1) must exist exactly once
    fallbacks = [h for h in hdrs if h[0] <= 1]
    if len(fallbacks) != 1:
        problems.append(f"expected 1 fallback block, found {len(fallbacks)}")
        fallback_durs = []
    else:
        fallback_durs = fallbacks[0][1]

    # 2. Fallback durations must equal expected_min * mult
    if expected is not None and fallback_durs:
        expected_fb_dur = expected * mult
        for d in fallback_durs:
            if d != expected_fb_dur:
                problems.append(
                    f"fallback dur={d} ({d//mult}×{mult}) "
                    f"expected {expected_fb_dur} ({expected}×{mult})"
                )

    # 3. Level coverage: every level from expected_min to 20 must be present
    if expected is not None:
        present = set(h[0] for h in hdrs)
        missing = set(range(expected, 21)) - present
        extra   = present - set(range(expected, 21)) - {0, 1}
        if missing:
            problems.append(f"missing levels: {sorted(missing)}")
        if extra:
            warnings.append(f"extra levels (SR tiers, ok): {sorted(extra)}")

    # 4. Explicit min vs filename-derived min sanity check
    if explicit_min is not None and name_min is not None:
        if explicit_min != name_min:
            warnings.append(
                f"explicit true_min={explicit_min} differs from "
                f"filename-derived {name_min} — intentional?"
            )

    # 5. SPCL: can't derive expected from name; just report installed value
    if name_min is None:
        installed_str = f"installed_min={installed}" if installed else "no non-fallback blocks"
        warnings.append(f"SPCL — cannot verify from name; {installed_str}")

    levels = sorted(h[0] for h in hdrs)
    tag    = f"lvl {installed}-20+fb" if installed else "fb only"

    if problems:
        FAIL += 1
        print(f"  FAIL  {resref}  ({tag})")
        for p in problems:
            print(f"          !! {p}")
        for w in warnings:
            print(f"          ?? {w}")
    elif warnings:
        WARN += 1
        print(f"  WARN  {resref}  ({tag})")
        for w in warnings:
            print(f"          ?? {w}")
    else:
        PASS += 1
        fb_dur = fallback_durs[0] if fallback_durs else "—"
        print(f"  ok    {resref}  ({tag})  fallback={fb_dur}s={fb_dur//mult if fallback_durs else '?'}×{mult}")

print()
print(f"Results: {PASS} passed, {WARN} warnings, {FAIL} failed  "
      f"({PASS+WARN+FAIL} spells total)")
