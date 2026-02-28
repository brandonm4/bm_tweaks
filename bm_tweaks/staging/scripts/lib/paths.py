from __future__ import annotations

from pathlib import Path


ROOT = Path(__file__).resolve().parents[4]
BM_TWEAKS = ROOT / "bm_tweaks"
OVERRIDE = ROOT / "override"
GENERATED_DIR = BM_TWEAKS / "generated"
REPORT_DIR = BM_TWEAKS / "staging" / "reports"
BACKUP_DIR = BM_TWEAKS / "staging" / "backups"
