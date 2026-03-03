#!/usr/bin/env python3

from __future__ import annotations

import struct
from pathlib import Path


ROOT = Path("/Volumes/Data/Games/Baldur's Gate II Enhanced Edition")
OVERRIDE = ROOT / "override"
CLABPR02 = OVERRIDE / "CLABPR02.2da"
KIT_IDS = OVERRIDE / "KIT.IDS"

KIT_NAME = "A7_MK_GODTALOS_NECROMANCER"
QD_PREFIX = "QD_MCP"
QD_HASH_PREFIX = "QD#MCP"


def parse_kit_id(path: Path, kit_name: str) -> int:
    for raw_line in path.read_text(errors="ignore").splitlines():
        line = raw_line.strip()
        if not line or line.startswith("//"):
            continue
        parts = line.split()
        if len(parts) >= 2 and parts[1].upper() == kit_name.upper():
            return int(parts[0], 16)
    raise RuntimeError(f"could not find {kit_name} in {path}")


def parse_clab(path: Path) -> dict[int, list[str]]:
    lines = [line.rstrip() for line in path.read_text(errors="ignore").splitlines() if line.strip()]
    header = next(line for line in lines if line.lstrip().startswith("1"))
    level_count = len(header.split())
    grants: dict[int, list[str]] = {level: [] for level in range(1, level_count + 1)}

    for line in lines:
        if not line.startswith("ABILITY"):
            continue
        parts = line.split()
        for level, token in enumerate(parts[1:], start=1):
            if token != "****":
                grants[level].append(token.upper())
    return grants


def make_eff_give_spell(resource: str) -> bytes:
    eff = bytearray(0x110)
    eff[0:16] = b"EFF V2.0EFF V2.0"
    for offset in (0x80, 0x84, 0x88, 0x8C):
        struct.pack_into("<I", eff, offset, 0xFFFFFFFF)
    struct.pack_into("<I", eff, 0x10, 171)
    struct.pack_into("<I", eff, 0x14, 2)
    struct.pack_into("<I", eff, 0x24, 1)
    struct.pack_into("<H", eff, 0x2C, 100)
    eff[0x30:0x38] = resource.encode("ascii").ljust(8, b"\0")
    return bytes(eff)


def make_spl_effect(
    opcode: int,
    *,
    target: int,
    parameter1: int = 0,
    parameter2: int = 0,
    timing: int = 9,
    dispel_resist: int = 0,
    duration: int = 0,
    resource: str = "",
) -> bytes:
    fx = bytearray(0x30)
    struct.pack_into("<H", fx, 0x00, opcode)
    fx[0x02] = target
    fx[0x03] = 0
    struct.pack_into("<I", fx, 0x04, parameter1 & 0xFFFFFFFF)
    struct.pack_into("<I", fx, 0x08, parameter2 & 0xFFFFFFFF)
    fx[0x0C] = timing
    fx[0x0D] = dispel_resist
    struct.pack_into("<I", fx, 0x0E, duration)
    fx[0x12] = 100
    fx[0x13] = 0
    fx[0x14:0x1C] = resource.encode("ascii").ljust(8, b"\0")
    return bytes(fx)


def build_spell(template: bytes, effects: list[bytes]) -> bytes:
    spell = bytearray(template[:0x9A])
    effect_count = len(effects)
    struct.pack_into("<I", spell, 0x64, 0x72)
    struct.pack_into("<H", spell, 0x68, 1)
    struct.pack_into("<I", spell, 0x6A, 0x9A)
    struct.pack_into("<H", spell, 0x6E, 0)
    struct.pack_into("<H", spell, 0x70, effect_count)
    struct.pack_into("<H", spell, 0x72 + 0x1E, effect_count)
    struct.pack_into("<H", spell, 0x72 + 0x20, 0)
    spell.extend(b"".join(effects))
    return bytes(spell)


def ensure_ga_eff(resource_name: str) -> str:
    eff_resref = f"{resource_name}#"
    eff_path = OVERRIDE / f"{eff_resref}.EFF"
    if not eff_path.exists():
        eff_path.write_bytes(make_eff_give_spell(resource_name))
    return eff_resref


def rebuild_helpers() -> None:
    kit_id = parse_kit_id(KIT_IDS, KIT_NAME)
    level_grants = parse_clab(CLABPR02)

    template_qd = (OVERRIDE / f"{QD_PREFIX}01.SPL").read_bytes()
    template_qd_hash = (OVERRIDE / f"{QD_HASH_PREFIX}01.SPL").read_bytes()

    for level in range(1, 51):
        level_tag = f"{level:02d}"
        qd_resref = f"{QD_PREFIX}{level_tag}"
        qd_hash_resref = f"{QD_HASH_PREFIX}{level_tag}"

        qd_effects = [
            make_spl_effect(146, target=1, parameter2=1, timing=9, resource=qd_hash_resref),
        ]

        for grant in level_grants[level]:
            if grant.startswith("GA_"):
                resource = grant[3:]
                eff_resref = ensure_ga_eff(resource)
                qd_effects.append(
                    make_spl_effect(
                        177,
                        target=1,
                        parameter1=kit_id,
                        parameter2=9,
                        timing=9,
                        resource=eff_resref,
                    )
                )

        qd_hash_effects = [
            make_spl_effect(206, target=1, parameter1=0xFFFFFFFF, timing=9, resource=qd_resref),
        ]

        (OVERRIDE / f"{qd_resref}.SPL").write_bytes(build_spell(template_qd, qd_effects))
        (OVERRIDE / f"{qd_hash_resref}.SPL").write_bytes(build_spell(template_qd_hash, qd_hash_effects))


def main() -> int:
    rebuild_helpers()
    print("rebuilt QD_MCP## and QD#MCP## helper spells from CLABPR02.2da")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
