#!/usr/bin/env python3

from __future__ import annotations

import csv
import pathlib

from lib.ie_formats import iter_override_casefold, resref, u16, u32
from lib.paths import OVERRIDE, REPORT_DIR


def iter_container_rows(area_path: pathlib.Path):
    blob = area_path.read_bytes()
    cont_off = u32(blob, 0x70)
    cont_num = u16(blob, 0x74)
    item_off = u32(blob, 0x78)

    for idx in range(cont_num):
        base = cont_off + idx * 192
        item_index = u32(blob, base + 0x40)
        item_num = u32(blob, base + 0x44)
        items = []
        for item_i in range(item_num):
            item_base = item_off + (item_index + item_i) * 20
            items.append(resref(blob, item_base))
        yield {
            "area": area_path.name.upper(),
            "container_index": idx,
            "item_count": item_num,
            "random_item_count": sum(1 for item in items if item.upper().startswith("RND")),
            "items": items,
        }


def main() -> None:
    REPORT_DIR.mkdir(parents=True, exist_ok=True)
    rows = []
    for path in iter_override_casefold(OVERRIDE, "ARE"):
        rows.extend(iter_container_rows(path))

    tsv_path = REPORT_DIR / "container_audit.tsv"
    with tsv_path.open("w", newline="") as fh:
        writer = csv.writer(fh, delimiter="\t")
        writer.writerow(["area", "container_index", "item_count", "random_item_count", "items"])
        for row in rows:
            writer.writerow(
                [
                    row["area"],
                    row["container_index"],
                    row["item_count"],
                    row["random_item_count"],
                    ",".join(row["items"]),
                ]
            )

    total = len(rows)
    non_empty = sum(1 for row in rows if row["item_count"] > 0)
    with_random = sum(1 for row in rows if row["random_item_count"] > 0)
    total_items = sum(row["item_count"] for row in rows)
    total_random_items = sum(row["random_item_count"] for row in rows)

    md_path = REPORT_DIR / "container_audit.md"
    with md_path.open("w") as fh:
        fh.write("# Container Audit\n\n")
        fh.write(f"- Areas scanned: `{len(set(row['area'] for row in rows))}`\n")
        fh.write(f"- Containers scanned: `{total}`\n")
        fh.write(f"- Non-empty containers: `{non_empty}`\n")
        fh.write(f"- Containers with any `RND*` item: `{with_random}`\n")
        fh.write(f"- Total container item slots populated: `{total_items}`\n")
        fh.write(f"- Total `RND*` item refs inside containers: `{total_random_items}`\n\n")
        fh.write("## Sample Containers With Random Placeholders\n\n")
        for row in [r for r in rows if r["random_item_count"]][:20]:
            fh.write(
                f"- `{row['area']}` container `{row['container_index']}`: "
                f"`{','.join(row['items'])}`\n"
            )


if __name__ == "__main__":
    main()
