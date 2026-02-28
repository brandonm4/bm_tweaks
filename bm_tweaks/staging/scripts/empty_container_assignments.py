#!/usr/bin/env python3

from __future__ import annotations

import csv
import pathlib
import statistics
import struct
import zlib
from collections import Counter, defaultdict


ROOT = pathlib.Path("/Volumes/Data/Games/Baldur's Gate II Enhanced Edition")
OVERRIDE = ROOT / "override"
GENERATED_DIR = ROOT / "bm_tweaks" / "generated"
REPORT_DIR = ROOT / "bm_tweaks" / "staging" / "reports"
AUDIT_TSV = REPORT_DIR / "container_audit.tsv"
SOURCE_BACKUP_DIR = ROOT / "bm_tweaks" / "staging" / "backups" / "pre_empty_container_component"
OUTPUT_TPA = GENERATED_DIR / "empty_container_assignments.tpa"
OUTPUT_TSV = REPORT_DIR / "empty_container_assignments.tsv"
OUTPUT_MD = REPORT_DIR / "empty_container_assignments.md"


def u16(blob: bytes, offset: int) -> int:
    return struct.unpack_from("<H", blob, offset)[0]


def u32(blob: bytes, offset: int) -> int:
    return struct.unpack_from("<I", blob, offset)[0]


def resref(blob: bytes, offset: int) -> str:
    return blob[offset : offset + 8].split(b"\0", 1)[0].decode("ascii", errors="ignore").upper()


def source_are_dir() -> pathlib.Path:
    if SOURCE_BACKUP_DIR.exists() and any(SOURCE_BACKUP_DIR.glob("*.ARE")):
        return SOURCE_BACKUP_DIR
    return OVERRIDE


def iter_empty_containers(area_dir: pathlib.Path):
    for path in sorted(area_dir.glob("*.ARE")):
        blob = path.read_bytes()
        cont_off = u32(blob, 0x70)
        cont_num = u16(blob, 0x74)
        for idx in range(cont_num):
            base = cont_off + idx * 0xC0
            item_num = u32(blob, base + 0x44)
            if item_num == 0:
                yield {"area": path.name.upper(), "container_index": idx}


def area_loot_flavor(area_name: str, area_dir: pathlib.Path) -> dict[str, int]:
    blob = (area_dir / area_name).read_bytes()
    cont_off = u32(blob, 0x70)
    cont_num = u16(blob, 0x74)
    item_off = u32(blob, 0x78)

    stats = {"containers": cont_num, "book": 0, "scroll": 0, "magic": 0, "potion": 0}
    for idx in range(cont_num):
        base = cont_off + idx * 0xC0
        item_index = u32(blob, base + 0x40)
        item_num = u32(blob, base + 0x44)
        for item_i in range(item_num):
            item_base = item_off + (item_index + item_i) * 20
            item = resref(blob, item_base)
            if item.startswith("BOOK"):
                stats["book"] += 1
            if item.startswith("SCRL") or item.startswith("RNDSCR"):
                stats["scroll"] += 1
            if item.startswith("WAND") or item.startswith("RNDMAG"):
                stats["magic"] += 1
            if item.startswith("POTN"):
                stats["potion"] += 1
    return stats


def load_cre_xp() -> dict[str, int]:
    xp_by_cre: dict[str, int] = {}
    for pattern in ("*.CRE", "*.cre"):
        for path in OVERRIDE.glob(pattern):
            key = path.stem.upper()
            if key not in xp_by_cre:
                xp_by_cre[key] = u32(path.read_bytes(), 0x14)
    return xp_by_cre


def area_power(area_name: str, cre_xp: dict[str, int]) -> tuple[int, int, int, int]:
    blob = (OVERRIDE / area_name).read_bytes()
    refs: list[str] = []

    actor_off = u32(blob, 0x54)
    actor_num = u16(blob, 0x58)
    for idx in range(actor_num):
        refs.append(resref(blob, actor_off + idx * 0x110 + 0x80))

    spawn_off = u32(blob, 0x60)
    spawn_num = u32(blob, 0x64)
    for idx in range(spawn_num):
        base = spawn_off + idx * 0xC8
        for slot in range(10):
            refs.append(resref(blob, base + 0x24 + slot * 8))

    xps = sorted(cre_xp[ref] for ref in refs if ref and ref in cre_xp and cre_xp[ref] > 0)
    if not xps:
        return (0, 0, 0, 0)

    top = xps[-min(5, len(xps)) :]
    return (len(xps), int(statistics.mean(xps)), int(statistics.mean(top)), max(xps))


def treasure_tier(area_name: str, top_avg_xp: int) -> int:
    if area_name.startswith("BG"):
        if top_avg_xp >= 1500:
            return 3
        if top_avg_xp >= 200:
            return 2
        return 1

    if top_avg_xp >= 12000:
        return 5
    if top_avg_xp >= 4000:
        return 4
    if top_avg_xp >= 1200:
        return 3
    if top_avg_xp >= 200:
        return 2
    return 1


def pick_item(area_name: str, container_index: int, top_avg_xp: int, flavor: dict[str, int]) -> str:
    tier = treasure_tier(area_name, top_avg_xp)
    roll = zlib.crc32(f"{area_name}:{container_index}".encode("ascii")) % 100
    scroll_weight = 0
    magic_weight = 0

    scroll_signal = flavor["scroll"] + flavor["book"] // 2
    magic_signal = flavor["magic"]
    containers = max(flavor["containers"], 1)

    if scroll_signal >= 10 or scroll_signal * 4 >= containers * 3:
        scroll_weight += 10
    elif scroll_signal >= 5 or scroll_signal * 4 >= containers:
        scroll_weight += 5

    if magic_signal >= 4 or magic_signal * 5 >= containers:
        magic_weight += 8
    elif magic_signal >= 2 or magic_signal * 10 >= containers:
        magic_weight += 4

    if area_name.startswith("BG"):
        if roll < 8 + scroll_weight:
            return "RNDSCR01"
        if roll < 10 + scroll_weight + magic_weight:
            return "RNDMAG01"
        return f"RNDTRE0{tier}"

    if tier >= 5:
        if roll < 10 + scroll_weight:
            return "RNDSCR03"
        if roll < 18 + scroll_weight + magic_weight:
            return "RNDMAG02"
    elif tier >= 4:
        if roll < 10 + scroll_weight:
            return "RNDSCR02"
        if roll < 16 + scroll_weight + magic_weight:
            return "RNDMAG01"
    elif tier >= 3:
        if roll < 9 + scroll_weight:
            return "RNDSCR01"
        if roll < 14 + scroll_weight + magic_weight:
            return "RNDMAG01"
    else:
        if roll < 7 + scroll_weight:
            return "RNDSCR01"
        if roll < 10 + scroll_weight + magic_weight:
            return "RNDMAG01"

    return f"RNDTRE0{tier}"


def main() -> None:
    GENERATED_DIR.mkdir(parents=True, exist_ok=True)
    REPORT_DIR.mkdir(parents=True, exist_ok=True)

    area_dir = source_are_dir()
    empty_rows = list(iter_empty_containers(area_dir))
    cre_xp = load_cre_xp()

    stats_by_area: dict[str, tuple[int, int, int, int]] = {}
    flavor_by_area: dict[str, dict[str, int]] = {}
    assignments: list[dict[str, object]] = []
    for row in empty_rows:
        area = row["area"]
        if area not in stats_by_area:
            stats_by_area[area] = area_power(area, cre_xp)
            flavor_by_area[area] = area_loot_flavor(area, area_dir)
        seen_cres, avg_xp, top_avg_xp, max_xp = stats_by_area[area]
        item = pick_item(area, int(row["container_index"]), top_avg_xp, flavor_by_area[area])
        assignments.append(
            {
                "area": area,
                "container_index": int(row["container_index"]),
                "item": item,
                "seen_cres": seen_cres,
                "avg_xp": avg_xp,
                "top_avg_xp": top_avg_xp,
                "max_xp": max_xp,
            }
        )

    with OUTPUT_TSV.open("w", newline="") as fh:
        writer = csv.writer(fh, delimiter="\t")
        writer.writerow(["area", "container_index", "item", "seen_cres", "avg_xp", "top_avg_xp", "max_xp"])
        for row in assignments:
            writer.writerow(
                [
                    row["area"],
                    row["container_index"],
                    row["item"],
                    row["seen_cres"],
                    row["avg_xp"],
                    row["top_avg_xp"],
                    row["max_xp"],
                ]
            )

    grouped: dict[str, list[dict[str, object]]] = defaultdict(list)
    for row in assignments:
        grouped[row["area"]].append(row)

    with OUTPUT_TPA.open("w") as fh:
        fh.write("// Auto-generated by staging/scripts/empty_container_assignments.py\n")
        fh.write("// Adds one random treasure placeholder to empty containers.\n\n")
        for area in sorted(grouped):
            sample = grouped[area][0]
            fh.write(
                f'COPY_EXISTING ~{area}~ ~override~ // top_avg_xp={sample["top_avg_xp"]} max_xp={sample["max_xp"]}\n'
            )
            for row in sorted(grouped[area], key=lambda r: int(r["container_index"])):
                fh.write(f'  SET container_index = {row["container_index"]}\n')
                fh.write(f'  SPRINT item_to_add ~{row["item"]}~\n')
                fh.write("  LPM BM_ADD_CONTAINER_ITEM\n")
            fh.write("BUT_ONLY_IF_IT_CHANGES\n\n")

    by_item = Counter(str(row["item"]) for row in assignments)
    by_family = Counter(str(row["area"])[:2] for row in assignments)
    with OUTPUT_MD.open("w") as fh:
        fh.write("# Empty Container Assignments\n\n")
        fh.write(f"- Empty containers assigned: `{len(assignments)}`\n")
        fh.write(f"- Areas affected: `{len(grouped)}`\n\n")
        fh.write(f"- Source area set: `{area_dir}`\n\n")
        fh.write("## By Item\n\n")
        for item, count in sorted(by_item.items()):
            fh.write(f"- `{item}`: `{count}`\n")
        fh.write("\n## By Family\n\n")
        for family, count in sorted(by_family.items()):
            fh.write(f"- `{family}`: `{count}`\n")


if __name__ == "__main__":
    main()
