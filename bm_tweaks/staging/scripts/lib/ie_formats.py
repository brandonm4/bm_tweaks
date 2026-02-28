from __future__ import annotations

import pathlib
import struct


def u16(blob: bytes, offset: int) -> int:
    return struct.unpack_from("<H", blob, offset)[0]


def u32(blob: bytes, offset: int) -> int:
    return struct.unpack_from("<I", blob, offset)[0]


def resref(blob: bytes, offset: int) -> str:
    return blob[offset : offset + 8].split(b"\0", 1)[0].decode("ascii", errors="ignore").upper()


def iter_override_casefold(directory: pathlib.Path, suffix: str):
    seen: set[str] = set()
    for path in sorted(directory.glob(f"*.{suffix.upper()}")):
        seen.add(path.name.upper())
        yield path
    for path in sorted(directory.glob(f"*.{suffix.lower()}")):
        if path.name.upper() not in seen:
            yield path
