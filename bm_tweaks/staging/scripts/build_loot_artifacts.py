#!/usr/bin/env python3

from __future__ import annotations

import subprocess
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
SCRIPTS = [
    "treasure_value_audit.py",
    "container_audit.py",
    "empty_container_assignments.py",
    "nonrandom_container_assignments.py",
]


def main() -> None:
    for script in SCRIPTS:
        subprocess.run([sys.executable, str(SCRIPT_DIR / script)], check=True)


if __name__ == "__main__":
    main()
