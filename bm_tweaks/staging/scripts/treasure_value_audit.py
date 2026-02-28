#!/usr/bin/env python3

from __future__ import annotations

import csv
import math
import re
from dataclasses import dataclass
from pathlib import Path


ROOT = Path(__file__).resolve().parents[3]
OVERRIDE = ROOT / "override"


@dataclass(frozen=True)
class RowRef:
    table: str
    row: str


TABLE_FILES = {
    "RNDTREAS": OVERRIDE / "RNDTREAS.2DA",
    "RNDTRES": OVERRIDE / "RNDTRES.2DA",
    "RNDMAGIC": OVERRIDE / "RNDMAGIC.2DA",
    "RNDSCROL": OVERRIDE / "RNDSCROL.2DA",
    "RNDWEP": OVERRIDE / "RNDWEP.2DA",
}


# EET remaps BG1 placeholder items to different live dummy names.
# These aliases are taken from EET's own conversion tables and comments.
ALIASES: dict[str, RowRef] = {
    "RNDTRE01": RowRef("RNDTREAS", "POOR"),
    "RNDTRE02": RowRef("RNDTREAS", "AVERAGE"),
    "RNDTRE03": RowRef("RNDTREAS", "WELL_OFF"),
    "RNDTRE04": RowRef("RNDTREAS", "WEALTHY"),
    "RNDTRE05": RowRef("RNDTREAS", "RICH"),
    "RNDTRE06": RowRef("RNDTREAS", "AVERAGE"),
    "RNDTRE07": RowRef("RNDTREAS", "WELL_OFF"),
    "RNDTRE08": RowRef("RNDTREAS", "WEALTHY"),
    "RNDTRE09": RowRef("RNDTREAS", "RICH"),
    "RNDMAG01": RowRef("RNDMAGIC", "LOW"),
    "RNDMAG02": RowRef("RNDMAGIC", "HIGH"),
    "RNDMAG03": RowRef("RNDMAGIC", "LOW"),
    "RNDMAG04": RowRef("RNDMAGIC", "HIGH"),
    "RNDMAG05": RowRef("RNDMAGIC", "POOP_BG1"),
    "RNDMAG06": RowRef("RNDTREAS", "POOR"),
    "RNDSCR01": RowRef("RNDSCROL", "1ST"),
    "RNDSCR02": RowRef("RNDSCROL", "2ND"),
    "RNDSCR03": RowRef("RNDSCROL", "3RD"),
    "RNDSCR04": RowRef("RNDSCROL", "1ST"),
    "RNDSCR05": RowRef("RNDSCROL", "2ND"),
    "RNDSCR06": RowRef("RNDSCROL", "3RD"),
    "RNDSCR07": RowRef("RNDSCROL", "4TH_BG1"),
    "RNDWEP01": RowRef("RNDWEP", "1ST"),
    "RNDWEP02": RowRef("RNDWEP", "2ND"),
    "RNDWEP03": RowRef("RNDWEP", "3RD"),
    "RNDWEP04": RowRef("RNDWEP", "1ST"),
    "RNDWEP05": RowRef("RNDWEP", "2ND"),
    "RNDWEP06": RowRef("RNDWEP", "3RD"),
}


def parse_2da(path: Path) -> dict[str, list[str]]:
    rows: dict[str, list[str]] = {}
    lines = path.read_text(encoding="utf-8", errors="replace").splitlines()
    for line in lines[2:]:
        parts = line.split()
        if not parts:
            continue
        rows[parts[0].upper()] = [part.upper() for part in parts[1:]]
    return rows


TABLES = {name: parse_2da(path) for name, path in TABLE_FILES.items()}


def item_path(resref: str) -> Path | None:
    candidates = [
        OVERRIDE / f"{resref}.ITM",
        ROOT / f"{resref}.ITM",
        ROOT / f"{resref.lower()}.itm",
    ]
    for candidate in candidates:
        if candidate.exists():
            return candidate
    return None


def item_price(resref: str) -> float | None:
    path = item_path(resref)
    if path is None:
        return None
    data = path.read_bytes()
    if len(data) < 0x38:
        return None
    return float(int.from_bytes(data[0x34:0x38], "little"))


def split_quantity(token: str) -> tuple[str, int]:
    if "*" not in token:
        return token, 1
    left, right = token.split("*", 1)
    if right.isdigit():
        return left, int(right)
    return token, 1


def token_value(token: str, stack: tuple[str, ...] = ()) -> float:
    token = token.upper()
    if token == "*" or not token:
        return 0.0
    if token.isdigit():
        return float(int(token))

    base, qty = split_quantity(token)
    if qty != 1:
        return token_value(base, stack) * qty

    if base in stack:
        raise ValueError(f"cycle detected: {' -> '.join(stack + (base,))}")

    if base in ALIASES:
        ref = ALIASES[base]
        return row_expected_value(ref.table, ref.row, stack + (base,))

    for table_name, rows in TABLES.items():
        if base in rows:
            return row_expected_value(table_name, base, stack + (base,))

    price = item_price(base)
    if price is not None:
        return price

    raise KeyError(base)


def row_expected_value(table_name: str, row_name: str, stack: tuple[str, ...] = ()) -> float:
    cells = TABLES[table_name][row_name]
    if not cells:
        return 0.0
    values = [token_value(cell, stack + (f"{table_name}.{row_name}",)) for cell in cells]
    return sum(values) / len(values)


def row_nonempty_average(table_name: str, row_name: str, stack: tuple[str, ...] = ()) -> float:
    cells = TABLES[table_name][row_name]
    values = [token_value(cell, stack + (f"{table_name}.{row_name}",)) for cell in cells if cell != "*"]
    if not values:
        return 0.0
    return sum(values) / len(values)


def format_gp(value: float) -> str:
    if math.isclose(value, round(value)):
        return str(int(round(value)))
    return f"{value:.2f}"


def main() -> None:
    reports = ROOT / "bm_tweaks" / "staging" / "reports"
    reports.mkdir(parents=True, exist_ok=True)

    targets = [
        ("RNDTRE01", "BG1 poor"),
        ("RNDTRE02", "BG1 average"),
        ("RNDTRE03", "BG1 well-off"),
        ("RNDTRE04", "BG1 wealthy"),
        ("RNDTRE05", "BG1 rich"),
        ("RNDTRE06", "EET average alias"),
        ("RNDTRE07", "EET well-off alias"),
        ("RNDTRE08", "EET wealthy alias"),
        ("RNDTRE09", "EET rich alias"),
        ("SODTRE07", "SoD trinkets"),
        ("SODTRE08", "SoD potions"),
        ("SODTRE09", "SoD gems"),
    ]

    rows_out: list[dict[str, str]] = []
    for placeholder, note in targets:
        if placeholder in ALIASES:
            ref = ALIASES[placeholder]
        else:
            ref = RowRef("RNDTRES", placeholder)

        expected = row_expected_value(ref.table, ref.row)
        nonempty = row_nonempty_average(ref.table, ref.row)
        rows_out.append(
            {
                "placeholder": placeholder,
                "semantic_row": f"{ref.table}.{ref.row}",
                "expected_gp": format_gp(expected),
                "nonempty_gp": format_gp(nonempty),
                "note": note,
            }
        )

    rows_out.sort(key=lambda row: float(row["expected_gp"]), reverse=True)

    tsv_path = reports / "treasure_placeholder_values.tsv"
    with tsv_path.open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(
            handle,
            fieldnames=["placeholder", "semantic_row", "expected_gp", "nonempty_gp", "note"],
            delimiter="\t",
        )
        writer.writeheader()
        writer.writerows(rows_out)

    md_path = reports / "treasure_placeholder_values.md"
    lines = [
        "# Treasure Placeholder Values",
        "",
        "Expected value includes empty `*` cells as zero-value outcomes.",
        "Non-empty value averages only the populated cells.",
        "",
        "| Placeholder | Semantic Row | Expected GP | Non-empty GP | Note |",
        "| --- | --- | ---: | ---: | --- |",
    ]
    for row in rows_out:
        lines.append(
            f"| {row['placeholder']} | {row['semantic_row']} | {row['expected_gp']} | {row['nonempty_gp']} | {row['note']} |"
        )
    md_path.write_text("\n".join(lines) + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
