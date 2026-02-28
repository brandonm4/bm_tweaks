#!/usr/bin/env python3

from __future__ import annotations

from lib.loot_model import (
    area_loot_flavor,
    area_power,
    load_cre_xp,
    pick_empty_container_item,
    source_are_dir,
    write_assignment_outputs,
)
from lib.paths import GENERATED_DIR, REPORT_DIR


OUTPUT_TPA = GENERATED_DIR / "empty_container_assignments.tpa"
OUTPUT_TSV = REPORT_DIR / "empty_container_assignments.tsv"
OUTPUT_MD = REPORT_DIR / "empty_container_assignments.md"


def iter_empty_containers(area_dir):
    from lib.ie_formats import u16, u32

    for path in sorted(area_dir.glob("*.ARE")):
        blob = path.read_bytes()
        cont_off = u32(blob, 0x70)
        cont_num = u16(blob, 0x74)
        for idx in range(cont_num):
            base = cont_off + idx * 0xC0
            item_num = u32(blob, base + 0x44)
            if item_num == 0:
                yield {"area": path.name.upper(), "container_index": idx}


def main() -> None:
    area_dir = source_are_dir()
    empty_rows = list(iter_empty_containers(area_dir))
    cre_xp = load_cre_xp()

    stats_by_area = {}
    flavor_by_area = {}
    assignments: list[dict[str, object]] = []
    for row in empty_rows:
        area = row["area"]
        if area not in stats_by_area:
            stats_by_area[area] = area_power(area, cre_xp)
            flavor_by_area[area] = area_loot_flavor(area, area_dir)
        stats = stats_by_area[area]
        item = pick_empty_container_item(area, int(row["container_index"]), stats.top_avg_xp, flavor_by_area[area])
        assignments.append(
            {
                "area": area,
                "container_index": int(row["container_index"]),
                "item": item,
                "seen_cres": stats.seen_cres,
                "avg_xp": stats.avg_xp,
                "top_avg_xp": stats.top_avg_xp,
                "max_xp": stats.max_xp,
            }
        )

    write_assignment_outputs(
        script_name="empty_container_assignments.py",
        heading="Empty Container Assignments",
        summary_label="Empty containers assigned",
        assignments=assignments,
        output_tpa=OUTPUT_TPA,
        output_tsv=OUTPUT_TSV,
        output_md=OUTPUT_MD,
        preface="Adds one random treasure placeholder to empty containers.",
    )


if __name__ == "__main__":
    main()
