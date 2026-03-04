# bm_tweaks

Personal WeiDU tweak pack for this EET install.

## Layout

- `bm_tweaks.tp2`: entrypoint with component declarations
- `components/`: one `.tpa` per installed WeiDU component
- `lib/`: shared WeiDU macros
- `generated/`: generated `.tpa` assignment files consumed by container components
- `staging/scripts/`: local tooling for audits and generation

## Editing Notes

- Keep `BEGIN` component declarations in `bm_tweaks.tp2`
- Put component bodies in `components/*.tpa`
- Container components rely on `lib/container_macros.tpa`
- If container assignment rules change, regenerate the generated `.tpa` files before reinstalling

## Staging Workflow

Use:

```sh
python3 bm_tweaks/staging/scripts/build_loot_artifacts.py
```

That regenerates:

- treasure placeholder audit reports
- container audit reports
- empty container assignment `.tpa`
- nonrandom filled container assignment `.tpa`

## Install / Reinstall

Use WeiDU from the game root on macOS:

```sh
./weidu bm_tweaks/bm_tweaks.tp2 --force-install 0
```

Replace `0` with the component number you want to reinstall.
Only designed for post eet_end installation.

## Repo Notes

- The repo is intentionally scoped to `bm_tweaks` plus root `.gitignore`
- `backup/` and `staging/backups/` are ignored
- `staging/reports/` is ignored
- `staging/scripts/` and `generated/` are tracked

## Current Components

- `0`: Small/Large swords usable by Cleric + Cleric/Mage. Clears the Cleric and Cleric/Mage unusability bits on sword items.
- `1`: Allow God Talos Necromancer specialization in swords. If `A7_MK_GODTALOS_NECROMANCER` exists in `weapprof.2da`, sets Small Sword and Large Sword proficiency caps to `2`.
- `2`: Standalone arcane spell failure for armor and shields. Removes prior CDTweaks/BM ASF effects, normalizes armor and shield weight by item family/material/enchantment, clears mage usability blocks on armor and shields, and applies EE-style ASF from generated `BMASF*.EFF` files.
- `3`: Lightning Bolt: classic projectile plus ground targeting. Patches all `SPWI308` abilities to use projectile `4`, range `40`, and updates the description to show a special area of effect.
- `4`: Conservative random loot table expansion for EET. Extends selected entries in `rndtres.2da`, `rndscrol.2da`, `rndequip.2da`, and `rndwep.2da` with a small set of additional items already suitable for this install.
- `5`: Add random treasure placeholders to creatures that lack any `RND*` loot. Assigns treasure tiers by creature XP and adds an extra high-tier roll to stronger creatures.
- `6`: Add conservative bonus random loot to containers that already use `RND*`. Reads the existing random categories in each container and adds one matching bonus placeholder without changing fixed loot.
- `7`: Add random loot to empty containers, scaled by area power. Uses generated assignment data to seed empty containers with restrained random treasure.
- `8`: Add flavored random loot to non-empty containers that lacked `RND*` entries. Uses generated assignment data to supplement fixed containers without turning them into full random treasure dumps.
- `9`: Summon duration scaling: `1 turn/level` from caster level `1` to `20`. Covers the stock summon set plus selected `MESpells` summons, currently including `Commando Conjuration` and `Phantasmal Dragon`.
- `10`: Animate Dead duration scaling: `1 hour/level` from caster level `1` to `20`. Covers the stock animate spells plus `MESpells` `Skeleton Horde`.
- `11`: Ensure all wizard and cleric spells have scroll items. Generates fallback `BMWI###` / `BMPR###` scrolls for visible `SPWI`/`SPPR` and `MEWI`/`MEPR` spells when no native non-BM scroll already exists.
- `12`: Add a scroll scribing kit for known wizard and cleric spells. Builds `BMSCRKIT`, compiles the generated dialog, prefers native scrolls where available, and supports both stock spells and `MESpells`.
- `13`: Add generated low-level wizard fallback scrolls to random treasure. Injects specific `BMWI###` scrolls into `rndscrol.2da` so otherwise-missing learnable wizard scrolls can appear in loot.
- `14`: Exceptional Strength carry-weight fix overriding CDTweaks component `2500`. Rewrites `strmodex.2da` so exceptional Strength uses `STR 18 base + percentile * 2`, making `18/01` start above ordinary `18`.
- `15`: Add Friendly Arm `MESpells` scrolls to High Hedge. Mirrors the Friendly Arm-only `MESpells` wizard scroll stock into `highhedg.sto`, except `Dimension Door`, which `MESpells` already adds there.
