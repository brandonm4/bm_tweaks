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

## Repo Notes

- The repo is intentionally scoped to `bm_tweaks` plus root `.gitignore`
- `backup/` and `staging/backups/` are ignored
- `staging/reports/` is ignored
- `staging/scripts/` and `generated/` are tracked

## Current Components

- `0`: swords usable by Cleric + Cleric/Mage
- `1`: remove CDTweaks ASF from armor/shields/items
- `2`: Lightning Bolt targeting/projectile/description tweak
- `3`: conservative random loot table expansion
- `4`: add random treasure to creatures lacking `RND*`
- `5`: add bonus random loot to containers already using `RND*`
- `6`: add random loot to empty containers
- `7`: add flavored random loot to filled containers lacking `RND*`
