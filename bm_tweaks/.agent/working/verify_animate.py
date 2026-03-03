import struct, os

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"

SPELLS = {
    # (true_min, mechanism, description)
    "SPWI505": (10,  "all",   "Animate Dead Wiz 5  - SR per-level, formula update only"),
    "SPWI601": (11,  "op177", "Create Undead Wiz 6 - was flat 8h"),
    "SPWI801": (15,  "all",   "Create Greater Undead Wiz 8 - SR 17-20, add 15-16"),
    "SPWI802": (15,  "all",   "Create Greater Undead SR alt - was flat 8h, 54 fx"),
    "SPPR301": (7,   "op177", "Animate Dead Priest - SR tiers 7/9/12"),
    "SPPR619": (11,  "op177", "Summon Greater Undead Priest 6 - was flat 8h"),
}

def find_spl(name):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + ".SPL":
            return os.path.join(OVERRIDE, fn)
    return None

def parse_spl(path):
    with open(path, "rb") as f:
        data = f.read()
    if data[0:4] != b"SPL ": return None
    abil_off = struct.unpack_from("<I", data, 0x64)[0]
    abil_num = struct.unpack_from("<H", data, 0x68)[0]
    fx_off   = struct.unpack_from("<I", data, 0x6a)[0]
    headers = []
    for i in range(abil_num):
        base    = abil_off + i * 0x28
        min_lvl = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx  = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt  = struct.unpack_from("<H", data, base + 0x1e)[0]
        real_durs = []
        anim_durs = []
        for j in range(fx_cnt):
            fb  = fx_off + (fx_idx + j) * 0x30
            dur = struct.unpack_from("<I", data, fb + 0x0e)[0]
            if dur > 30:
                real_durs.append(dur)
            elif dur > 0:
                anim_durs.append(dur)
        headers.append((min_lvl, real_durs, anim_durs))
    return headers

PASS = FAIL = 0

for resref, (true_min, mech, desc) in sorted(SPELLS.items()):
    path = find_spl(resref)
    if not path:
        print(f"  MISSING  {resref}"); FAIL += 1; continue

    hdrs = parse_spl(path)
    if not hdrs:
        print(f"  PARSE ERR {resref}"); FAIL += 1; continue

    problems = []
    levels = sorted(h[0] for h in hdrs)

    # 1. Coverage: every level true_min..20 must be present
    expected = set(range(true_min, 21))
    present  = set(levels)
    missing  = expected - present
    extra    = present - expected - {0, 1}
    if missing: problems.append(f"missing levels: {sorted(missing)}")
    if extra:   problems.append(f"unexpected levels: {sorted(extra)}")

    # 2. Fallback block (level 0 or 1) must exist, exactly once
    fallbacks = [h for h in hdrs if h[0] <= 1]
    if len(fallbacks) != 1:
        problems.append(f"expected 1 fallback, found {len(fallbacks)}")

    # 3. Every real duration must equal eff_level * 300
    for (lvl, real_durs, anim_durs) in hdrs:
        eff_lvl      = true_min if lvl <= 1 else lvl
        expected_dur = eff_lvl * 300
        for d in real_durs:
            if d != expected_dur:
                problems.append(f"  lvl {lvl}: dur={d}, expected {expected_dur} ({eff_lvl}*300)")

    # 4. Anim durations must all be <= 30 (unchanged)
    for (lvl, real_durs, anim_durs) in hdrs:
        for d in anim_durs:
            if d > 30:
                problems.append(f"  lvl {lvl}: anim dur={d} was changed (should be <= 30)")

    if problems:
        FAIL += 1
        print(f"  FAIL  {resref}  (true_min={true_min}, levels={levels})")
        for p in problems:
            print(f"          {p}")
    else:
        PASS += 1
        # show a compact summary of the duration range
        dur_range = sorted(set(
            (true_min if h[0]<=1 else h[0]) * 300
            for h in hdrs
        ))
        print(f"  ok    {resref}  lvls {true_min}-20+fallback  "
              f"dur {dur_range[0]}s-{dur_range[-1]}s  | {desc}")

print()
print(f"Results: {PASS} passed, {FAIL} failed out of {PASS+FAIL} spells")
