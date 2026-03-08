import struct, os, sys

OVERRIDE = "/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/override"

# All spells touched by 08_summon_duration.tpa with their expected true_min
SPELLS = {
    # inferred from file (monster summoning line)
    "SPWI107": None, "SPWI216": None, "SPWI309": None, "SPWI407": None,
    "SPWI423": None, "SPWI504": None, "SPWI610": None, "SPWI706": None,
    "SPWI806": None,
    # explicit true_min
    "SPWI807": 15,   # Summon Fiend
    "SPWI905": 17,   # Gate
    "SPWI501": None, # Summon Shadow
    "SPWI707": 13,   # Summon Death Knight
    # priest conjuration (inferred)
    "SPPR119": None, "SPPR220": None, "SPPR320": None, "SPPR402": None,
    "SPPR501": None, "SPPR602": None, "SPPR410": None,
    # priest explicit
    "SPPR716": 13, "SPPR703": 13,
    "SPPR726": 20, "SPPR727": 20,
    # already full coverage (inferred)
    "SPPR605": None, "SPPR617": None, "SPPR618": None,
    "SPWI516": None, "SPWI520": None, "SPWI521": None, "SPWI526": None,
    "SPWI620": None, "SPWI621": None, "SPWI622": None, "SPWI633": None,
    "SPCL923": None, "SPCL935": None,
    "SPWI624": None, "SPWI719": None,
    "SPWI717": None, "SPWI718": None,
    "SPWI619": None,
}

def find_file(name):
    for fn in os.listdir(OVERRIDE):
        if fn.upper() == name.upper() + ".SPL":
            return os.path.join(OVERRIDE, fn)
    return None

def parse_spl(path):
    with open(path, "rb") as f:
        data = f.read()
    sig = data[0:4]
    if sig != b"SPL ":
        return None, f"bad sig {sig}"
    abil_off  = struct.unpack_from("<I", data, 0x64)[0]
    abil_num  = struct.unpack_from("<H", data, 0x68)[0]
    fx_off    = struct.unpack_from("<I", data, 0x6a)[0]

    headers = []
    for i in range(abil_num):
        base = abil_off + i * 0x28
        min_lvl   = struct.unpack_from("<H", data, base + 0x10)[0]
        fx_idx    = struct.unpack_from("<H", data, base + 0x20)[0]
        fx_cnt    = struct.unpack_from("<H", data, base + 0x1e)[0]
        # find op-177 durations in this header's effects
        durations = []
        for j in range(fx_cnt):
            fbase = fx_off + (fx_idx + j) * 0x30
            opcode = struct.unpack_from("<H", data, fbase)[0]
            if opcode == 177:
                dur = struct.unpack_from("<I", data, fbase + 0x0e)[0]
                durations.append(dur)
        headers.append((min_lvl, durations))
    return headers, None

PASS = 0
FAIL = 0

for resref, explicit_min in sorted(SPELLS.items()):
    path = find_file(resref)
    if not path:
        print(f"  MISSING  {resref}.spl")
        FAIL += 1
        continue

    headers, err = parse_spl(path)
    if err:
        print(f"  ERROR    {resref}: {err}")
        FAIL += 1
        continue

    # Infer true_min if not explicit
    if explicit_min is None:
        non_fallback = [h[0] for h in headers if h[0] > 1]
        true_min = min(non_fallback) if non_fallback else 1
    else:
        true_min = explicit_min

    levels_present = sorted(h[0] for h in headers)

    problems = []

    # 1. Every level from true_min to 20 must be present
    expected_levels = set(range(true_min, 21))
    present_set     = set(levels_present)
    missing = expected_levels - present_set
    extra   = present_set - expected_levels - {0, 1}  # 0/1 are fallback, ok
    if missing:
        problems.append(f"missing levels: {sorted(missing)}")
    if extra:
        problems.append(f"unexpected levels: {sorted(extra)}")

    # 2. Each header's op-177 duration must equal level*600
    #    (fallback level 0 or 1 => true_min*600)
    for (lvl, durs) in headers:
        eff_lvl = true_min if lvl <= 1 else lvl
        expected_dur = eff_lvl * 600
        for dur in durs:
            if dur != expected_dur:
                problems.append(
                    f"  level {lvl}: op177 dur={dur}, expected {expected_dur} (level {eff_lvl}*600)"
                )

    # 3. Must have exactly one fallback (level 0 or 1)
    fallbacks = [h for h in headers if h[0] <= 1]
    if len(fallbacks) != 1:
        problems.append(f"expected 1 fallback block, found {len(fallbacks)}")

    if problems:
        FAIL += 1
        print(f"  FAIL  {resref}  (true_min={true_min}, levels={levels_present})")
        for p in problems:
            print(f"          {p}")
    else:
        PASS += 1
        print(f"  ok    {resref}  (true_min={true_min}, headers={len(headers)}, levels {true_min}-20 + fallback)")

print()
print(f"Results: {PASS} passed, {FAIL} failed out of {PASS+FAIL} spells")
