#!/usr/bin/env python3

from __future__ import annotations

import struct
import sys
from pathlib import Path


HEADER_PARTY_OFFSET = 0x20
HEADER_PARTY_COUNT = 0x24
HEADER_NONPARTY_OFFSET = 0x30
HEADER_NONPARTY_COUNT = 0x34
HEADER_GLOBALS_OFFSET = 0x38
HEADER_JOURNAL_COUNT = 0x4C
HEADER_JOURNAL_OFFSET = 0x50
HEADER_FAMILIAR_OFFSET = 0x68
HEADER_STORED_OFFSET = 0x70
HEADER_STORED_COUNT = 0x74
HEADER_POCKET_OFFSET = 0x78
HEADER_POCKET_COUNT = 0x7C

NPC_STRUCT_SIZE = 0x160
CRE_FX_OFFSET = 0x2C4
CRE_FX_COUNT = 0x2C8
CRE_FX_SIZE = 0x108


def read_u32(data: bytes, offset: int) -> int:
    return struct.unpack_from("<I", data, offset)[0]


def write_u32(buf: bytearray, offset: int, value: int) -> None:
    struct.pack_into("<I", buf, offset, value)


def make_cre_fx(opcode: int, resource: str, *, parameter2: int = 0, timing: int = 1, duration: int = 0) -> bytes:
    fx = bytearray(CRE_FX_SIZE)
    write_u32(fx, 0x08, opcode)
    write_u32(fx, 0x0C, 1)  # self
    write_u32(fx, 0x10, 0)  # power
    write_u32(fx, 0x14, 0)  # parameter1
    write_u32(fx, 0x18, parameter2)
    write_u32(fx, 0x1C, timing)
    write_u32(fx, 0x20, duration)
    struct.pack_into("<H", fx, 0x24, 100)
    struct.pack_into("<H", fx, 0x26, 0)
    fx[0x28:0x30] = resource.encode("ascii").ljust(8, b"\0")
    write_u32(fx, 0x88, 1)
    fx[0x8C:0x94] = b"A7_HST1\0"
    return bytes(fx)


MISSING_HST_EFFECTS = [
    make_cre_fx(177, "A7_HST1", parameter2=2, timing=1, duration=0),
    make_cre_fx(172, "A7_HST1", parameter2=0, timing=1, duration=0),
    make_cre_fx(171, "A7_HST2", parameter2=0, timing=0, duration=3600000),
    make_cre_fx(174, "EFF_M02", parameter2=0, timing=1, duration=0),
]


def patch_save(path: Path) -> str:
    data = bytearray(path.read_bytes())

    party_offset = read_u32(data, HEADER_PARTY_OFFSET)
    party_count = read_u32(data, HEADER_PARTY_COUNT)
    if party_count < 1:
        raise RuntimeError("save has no party records")

    brand_npc = party_offset
    cre_offset = read_u32(data, brand_npc + 0x04)
    cre_size = read_u32(data, brand_npc + 0x08)

    fx_offset = read_u32(data, cre_offset + CRE_FX_OFFSET)
    fx_count = read_u32(data, cre_offset + CRE_FX_COUNT)
    fx_block_end = cre_offset + fx_offset + fx_count * CRE_FX_SIZE
    cre_end = cre_offset + cre_size

    if fx_block_end != cre_end:
        raise RuntimeError(
            f"expected fx block to end at CRE boundary, got fx_end={hex(fx_block_end)} cre_end={hex(cre_end)}"
        )

    for i in range(fx_count):
        off = cre_offset + fx_offset + i * CRE_FX_SIZE
        opcode = read_u32(data, off + 0x08)
        resource = bytes(data[off + 0x28 : off + 0x30]).split(b"\0", 1)[0].decode("ascii", "ignore")
        if opcode in {171, 172, 174, 177} and resource in {"A7_HST1", "A7_HST2", "EFF_M02"}:
            return "save already contains active A7 helper effects; no patch applied"

    insertion = b"".join(MISSING_HST_EFFECTS)
    delta = len(insertion)
    data[fx_block_end:fx_block_end] = insertion

    write_u32(data, cre_offset + CRE_FX_COUNT, fx_count + len(MISSING_HST_EFFECTS))
    write_u32(data, brand_npc + 0x08, cre_size + delta)

    nonparty_offset = read_u32(data, HEADER_NONPARTY_OFFSET)
    nonparty_count = read_u32(data, HEADER_NONPARTY_COUNT)

    for section_offset in (
        HEADER_NONPARTY_OFFSET,
        HEADER_GLOBALS_OFFSET,
        HEADER_JOURNAL_OFFSET,
        HEADER_FAMILIAR_OFFSET,
        HEADER_STORED_OFFSET,
        HEADER_POCKET_OFFSET,
    ):
        value = read_u32(data, section_offset)
        if value > fx_block_end:
            write_u32(data, section_offset, value + delta)

    for idx in range(1, party_count):
        npc_off = party_offset + idx * NPC_STRUCT_SIZE
        value = read_u32(data, npc_off + 0x04)
        if value > fx_block_end:
            write_u32(data, npc_off + 0x04, value + delta)

    if nonparty_offset:
        adjusted_nonparty_offset = read_u32(data, HEADER_NONPARTY_OFFSET)
        for idx in range(nonparty_count):
            npc_off = adjusted_nonparty_offset + idx * NPC_STRUCT_SIZE
            value = read_u32(data, npc_off + 0x04)
            if value > fx_block_end:
                write_u32(data, npc_off + 0x04, value + delta)

    path.write_bytes(data)
    return f"patched {path} with {len(MISSING_HST_EFFECTS)} A7 helper effects"


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: repair_save_kit_state.py /path/to/BALDUR.gam", file=sys.stderr)
        return 2

    path = Path(sys.argv[1])
    if not path.exists():
        print(f"missing file: {path}", file=sys.stderr)
        return 2

    print(patch_save(path))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
