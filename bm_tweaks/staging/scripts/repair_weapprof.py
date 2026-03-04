#!/usr/bin/env python3

from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
WEAPPROF = ROOT / "override" / "weapprof.2da"

FIGHTER_MULTI_COLUMNS = {
    "FIGHTER_MAGE",
    "FIGHTER_CLERIC",
    "FIGHTER_THIEF",
    "FIGHTER_MAGE_THIEF",
    "FIGHTER_DRUID",
    "FIGHTER_MAGE_CLERIC",
    "A7_MK_BERSERKER_MAGE",
    "A7_MK_KENSAI_MAGE",
}


def format_2da_lines(preamble: list[str], rows: list[list[str]]) -> str:
    normalized_rows: list[list[str]] = []
    for idx, row in enumerate(rows):
      if idx == 0:
        normalized_rows.append([""] + row)
      else:
        normalized_rows.append(row)

    col_count = max(len(row) for row in normalized_rows)
    widths = [0] * col_count

    for row in normalized_rows:
        for idx, token in enumerate(row):
            widths[idx] = max(widths[idx], len(token))

    formatted = list(preamble)
    for row in normalized_rows:
        padded = [token.ljust(widths[idx]) for idx, token in enumerate(row)]
        formatted.append("  ".join(padded).rstrip())

    return "\n".join(formatted) + "\n"


def main() -> None:
    lines = WEAPPROF.read_text().splitlines()
    header_idx = next(i for i, line in enumerate(lines) if "NAME_REF" in line and "DESC_REF" in line)
    header = lines[header_idx].split()

    index_map = {name: idx for idx, name in enumerate(header)}
    sword_one_pip_columns = {
        "CLERIC",
        "CLERIC_MAGE",
        "CLERIC_THIEF",
        "HELM",
        "OHTEMPUS",
        "TALOS",
        "OHTYR",
        "A7_MK_GODTALOS_NECROMANCER",
    }
    sword_two_pip_columns = set()

    for name in header:
        if name.startswith("A7_MK_GODTALOS_") and name != "A7_MK_GODTALOS_NECROMANCER":
            sword_one_pip_columns.add(name)
        elif name.startswith("A7_MK_OHTYR_"):
            sword_one_pip_columns.add(name)

    sword_one_pip_indexes = {
        name: index_map[name]
        for name in sword_one_pip_columns
        if name in index_map
    }
    sword_two_pip_indexes = {
        name: index_map[name]
        for name in sword_two_pip_columns
        if name in index_map
    }
    cleric_ranger_idx = index_map.get("CLERIC_RANGER", -1)

    fighter_idx = index_map.get("FIGHTER", -1)
    paladin_idx = index_map.get("PALADIN", -1)
    ranger_idx = index_map.get("RANGER", -1)
    fighter_multi_indexes = {
        name: index_map[name]
        for name in FIGHTER_MULTI_COLUMNS
        if name in index_map
    }

    preamble = lines[:header_idx]
    fixed_rows: list[list[str]] = [header]
    for line in lines[header_idx + 1:]:
        if not line.strip():
            continue

        parts = line.split()
        if len(parts) < 4:
            continue

        row_name = parts[0]
        row_id = parts[1]

        if row_id == "102" and row_name in {"BG1_SMALL_SWORD", "SMALL_SWORD"}:
            parts[0] = "SMALL_SWORD"
        elif row_id == "103" and row_name in {"BG1_LARGE_SWORD", "LARGE_SWORD"}:
            parts[0] = "LARGE_SWORD"

        fighter_token_idx = fighter_idx + 1
        fighter_value = parts[fighter_token_idx] if 0 <= fighter_token_idx < len(parts) else "0"

        # Rows where the base Fighter gets 5 are treated as fighter weapons.
        if fighter_value == "5":
            if paladin_idx >= 0:
                paladin_token_idx = paladin_idx + 1
                if paladin_token_idx < len(parts) and parts[paladin_token_idx] != "0":
                    parts[paladin_token_idx] = "3"
            if ranger_idx >= 0:
                ranger_token_idx = ranger_idx + 1
                if ranger_token_idx < len(parts) and parts[ranger_token_idx] != "0":
                    parts[ranger_token_idx] = "3"

            for multi_idx in fighter_multi_indexes.values():
                multi_token_idx = multi_idx + 1
                if multi_token_idx < len(parts):
                    parts[multi_token_idx] = fighter_value

        if parts[0] in {
            "LARGE_SWORD",
            "SMALL_SWORD",
            "LARGE_SWORD_BG1",
            "SMALL_SWORD_BG1",
        }:
            for col_idx in sword_one_pip_indexes.values():
                token_idx = col_idx + 1
                if token_idx < len(parts):
                    parts[token_idx] = "1"

            for col_idx in sword_two_pip_indexes.values():
                token_idx = col_idx + 1
                if token_idx < len(parts):
                    parts[token_idx] = "2"

            if cleric_ranger_idx >= 0:
                token_idx = cleric_ranger_idx + 1
                if token_idx < len(parts):
                    parts[token_idx] = "3"

        fixed_rows.append(parts)

    WEAPPROF.write_text(format_2da_lines(preamble, fixed_rows))


if __name__ == "__main__":
    main()
