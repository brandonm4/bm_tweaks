#!/usr/bin/env python3

from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
WEAPPROF = ROOT / "override" / "weapprof.2da"


def main() -> None:
    lines = WEAPPROF.read_text().splitlines()
    nonempty = [line for line in lines if line.strip()]
    header_idx = next(i for i, line in enumerate(lines) if "NAME_REF" in line and "DESC_REF" in line)
    header = lines[header_idx].split()

    try:
        godtalos_idx = header.index("A7_MK_GODTALOS_NECROMANCER")
    except ValueError:
        godtalos_idx = -1

    fixed_lines: list[str] = []
    for line in lines:
        if not line.strip() or line is lines[header_idx]:
            fixed_lines.append(line)
            continue

        parts = line.split()
        if len(parts) < 4:
            fixed_lines.append(line)
            continue

        row_name = parts[0]
        row_id = parts[1]

        if row_name == "SMALL_SWORD" and row_id == "102":
            parts[0] = "BG1_SMALL_SWORD"
        elif row_name == "LARGE_SWORD" and row_id == "103":
            parts[0] = "BG1_LARGE_SWORD"

        if godtalos_idx >= 0 and parts[0] in {
            "LARGE_SWORD",
            "SMALL_SWORD",
            "BG1_LARGE_SWORD",
            "BG1_SMALL_SWORD",
        }:
            # Data rows include the row label in column 0, so shift the header index by one.
            token_idx = godtalos_idx + 1
            if token_idx < len(parts):
                parts[token_idx] = "2"

        fixed_lines.append(" ".join(parts))

    WEAPPROF.write_text("\n".join(fixed_lines) + "\n")


if __name__ == "__main__":
    main()
