# bm_tweaks — Development Notes

## Game / Tool Stack
- **Game**: Baldur's Gate II Enhanced Edition
- **Root**: `/Volumes/Data/Games/Baldur's Gate II Enhanced Edition/`
- **WeiDU**: installed at game root (`./weidu`)
- **Key installed mods affecting our work**: Spell Revisions (`spell_rev/`), Tweaks Anthology (`cdtweaks/`), EET, IWDification

---

## Mod Structure

```
bm_tweaks/
├── bm_tweaks.tp2
├── notes.md                          ← this file
├── lib/
│   ├── container_macros.tpa          pre-existing
│   └── spl_itm_macros.tpa            shared SPL/ITM patch functions (loaded in ALWAYS block)
└── components/
    ├── 00–07_*.tpa                   pre-existing, not touched
    ├── 08_summon_duration.tpa        summon scaling — DONE (mechanics); desc TODO
    └── 09_animate_duration.tpa       animate dead scaling — DONE (mechanics); desc TODO
```

`bm_tweaks.tp2` ALWAYS block INCLUDEs both lib files before any BEGIN block, so functions
defined there are available in all components.

---

## Components 08 & 09 — Status

### What was done
Both components are mechanically correct and fully verified:
- Every patched spell has one fallback block (min\_level ≤ 1) and one block per level
  from `true_min` to 20.
- Fallback block duration = `true_min × multiplier`.
- All per-level block durations = `level × multiplier`.
- Animation/sound effects (dur ≤ 30) are left untouched.

### What still needs doing
**Spell description text in dialog.tlk is still stale** — it shows the pre-mod
duration (e.g. "Duration: 3 turns", "Duration: 8 hours").  The mechanics are
correct in-game but the description shown in the spellbook is wrong.

---

## SPL Header Layout (relevant offsets)

| Offset | Type  | Field                      |
|--------|-------|----------------------------|
| 0x08   | DWORD | Unidentified name StrRef   |
| 0x0c   | DWORD | Identified name StrRef     |
| 0x50   | DWORD | **Description StrRef** ← use this |
| 0x54   | DWORD | Identified desc StrRef (0 for all patched spells — skip) |
| 0x64   | DWORD | Extended header (abilities) offset |
| 0x68   | WORD  | Extended header count      |
| 0x6a   | DWORD | Effect table offset        |

---

## Description Update Plan

### WeiDU function to add to `lib/spl_itm_macros.tpa`

```weidu
DEFINE_ACTION_FUNCTION BM_UPDATE_SPELL_DESC
  STR_VAR resref   = ""
          new_dur  = ""
BEGIN
  COPY_EXISTING ~%resref%.spl~ ~override~
    READ_LONG 0x50 "desc_strref"
    OUTER_SET BM_desc_strref = desc_strref
  BUT_ONLY

  ACTION_IF (BM_desc_strref > 0 AND BM_desc_strref < 0xffffffff) BEGIN
    OUTER_SPRINT cur_text RESOLVE_STR_REF (BM_desc_strref)
    OUTER_PATCH_SAVE new_text ~%cur_text%~ BEGIN
      REPLACE_TEXTUALLY ~Duration: 3 turns~                   ~Duration: %new_dur%~
      REPLACE_TEXTUALLY ~Duration: 8 hours~                   ~Duration: %new_dur%~
      REPLACE_TEXTUALLY ~Duration: 1 round/level~             ~Duration: %new_dur%~
      REPLACE_TEXTUALLY ~Duration: 1 turn + 1 round/level~    ~Duration: %new_dur%~
      REPLACE_TEXTUALLY ~Duration: 8 rounds + 1 round/level~  ~Duration: %new_dur%~
      REPLACE_TEXTUALLY ~Duration: 4 rounds + 1 round/level~  ~Duration: %new_dur%~
    END
    ACTION_IF NOT (~%cur_text%~ STRING_EQUAL ~%new_text%~) BEGIN
      STRING_SET BM_desc_strref ~%new_text%~
    END
  END
END
```

Key design notes:
- All known "old duration" patterns are tried; only the matching one fires per spell.
- `new_dur` is the caller-supplied replacement text — different for comp08 vs comp09.
- STRING_SET only called when text actually changed (avoids needless TLK writes).
- `OUTER_SET` inside the COPY_EXISTING is needed to export the StrRef to action context.
- `0x54` is 0 for all patched spells, so only `0x50` is read.

### Component 08 call block (append to `08_summon_duration.tpa`)

`new_dur = ~1 turn/level~` for all 43 spells:

```weidu
ACTION_FOR_EACH spl IN
  SPWI107  SPWI216  SPWI309  SPWI407  SPWI423
  SPWI501  SPWI504  SPWI516  SPWI520  SPWI521  SPWI526
  SPWI610  SPWI619  SPWI620  SPWI621  SPWI622  SPWI624  SPWI633
  SPWI706  SPWI707  SPWI717  SPWI718  SPWI719
  SPWI806  SPWI807  SPWI905
  SPPR119  SPPR220  SPPR320  SPPR402  SPPR410
  SPPR501  SPPR602  SPPR605  SPPR617  SPPR618
  SPPR703  SPPR716  SPPR726  SPPR727
  SPCL923  SPCL935
BEGIN
  LPF BM_UPDATE_SPELL_DESC STR_VAR resref = ~%spl%~ new_dur = ~1 turn/level~ END
END
```

### Component 09 call block (append to `09_animate_duration.tpa`)

`new_dur = ~1 hour/level~` for all 6 spells:

```weidu
ACTION_FOR_EACH spl IN
  SPWI505  SPWI601  SPWI801  SPWI802  SPPR301  SPPR619
BEGIN
  LPF BM_UPDATE_SPELL_DESC STR_VAR resref = ~%spl%~ new_dur = ~1 hour/level~ END
END
```

### Verification — what to check after applying
Run a Python script that:
1. For each patched spell, reads the description StrRef at 0x50.
2. Reads the TLK string.
3. Checks that "Duration:" is followed by the expected text.
4. Flags any spell where an old pattern ("3 turns", "8 hours", "round/level", etc.) still appears.

---

## Exact Description Patterns Found (per spell)

### Component 08 (→ `1 turn/level`)

| Pattern in description         | Spells (StrRef)                                                        |
|-------------------------------|------------------------------------------------------------------------|
| `Duration: 3 turns`           | SPWI107(272410) SPWI216/407(272479) SPWI309(272487) SPWI423(272524) SPWI501(272532) SPWI504(272534) SPWI610(272586) SPWI706(272612) SPWI707(272594) SPWI806(272635) SPWI807(272619) SPWI905(272638) SPPR119(272222) SPPR220(272259) SPPR320(272282) SPPR402(272293) SPPR410(272303) SPPR501(272315) SPPR602(272346) SPPR703(272368) SPPR716(272388) SPPR726(272396) SPPR727(272397) |
| `Duration: 1 turn + 1 round/level` | SPWI516(272551) SPWI520(272555) SPWI521(272556) SPWI526(273173) SPWI620(272580) SPWI621(272581) SPWI622(272582) SPWI633(273174) SPPR605(272349) SPPR617(272361) SPPR618(272362) |
| `Duration: 1 round/level`     | SPWI619(226580) SPWI624/719(272584)                                    |
| `Duration: 8 rounds + 1 round/level` | SPWI717(272606) SPWI718(272607)                                |
| `Duration: 4 rounds + 1 round/level` | SPCL923(63829) SPCL935(63831)                                  |

Note: SPWI216 and SPWI407 share StrRef 272479 — patching once covers both.
Note: SPWI624 and SPWI719 share StrRef 272584 — patching once covers both.

### Component 09 (→ `1 hour/level`)

| Pattern in description         | Spells (StrRef)                                                        |
|-------------------------------|------------------------------------------------------------------------|
| `Duration: 8 hours`           | SPWI601(272560) SPWI802(272544) SPPR301(272260) SPPR619(272364)        |
| `Duration: 1 round/level`     | SPWI505(272535) SPWI801(272614)                                        |

---

## Key Lessons Learned (do not repeat these mistakes)

### 1. SR tier blocks ≠ cast eligibility
Spell Revisions adds creature-quality tier blocks starting 2–4 levels ABOVE the
spell's minimum cast level. `BM_SUMMON_INFER_AND_SCALE` / `BM_ANIMATE_INFER_AND_SCALE`
both read the lowest non-fallback block and use that as `true_min`. This is WRONG
for any spell SR has touched.

**Rule**: always pass `true_min` explicitly. Derive it from spell level using
`2 * spell_level - 1` (same formula for wizard and priest).

Wizard:   L1→1  L2→3  L3→5  L4→7  L5→9  L6→11  L7→13  L8→15  L9→17
Priest:   same formula up to L7

SPCL innates: derive from context, not filename.

### 2. Description StrRef is at SPL offset 0x50
Offset 0x54 (identified description) is 0 for all the spells we touched.
Use 0x50 for description reads.

### 3. WeiDU: exporting patch-context vars to action context
To use a value read inside `COPY_EXISTING` in subsequent action-context code, use
`OUTER_SET varname = patchvar` inside the patch block.

### 4. File tool limitations
`create_new_file` and `multi_edit` silently fail when the working path contains
spaces and an apostrophe (`Baldur's Gate II Enhanced Edition`).
Use `python3 -` heredocs or `run_terminal_command` for all file writes in the game dir.

---

## Verification Scripts
All kept in `bm_tweaks/.agent/working/`:
- `verify_all.py` — checks level coverage, fallback durations, and effect formulas
  for all 48 spells across both components.  Run with `python3 bm_tweaks/.agent/working/verify_all.py`.
- `verify_animate.py` — earlier, component-09-only version (superseded by verify_all.py).
- `read_desc.py` — scans SPL header for description StrRefs and prints Duration: lines.

After implementing description updates, add a description-verification pass to
`verify_all.py` that checks the TLK strings no longer contain stale duration text.
