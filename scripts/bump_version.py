#!/usr/bin/env python3
"""Erhoeht die Patch-Version in BP/manifest.json und RP/manifest.json
(Header, Module, Dependencies) synchron um 1, damit Minecraft das
Add-on beim erneuten Import immer als Update erkennt."""
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
BP_MANIFEST = ROOT / "BP" / "manifest.json"
RP_MANIFEST = ROOT / "RP" / "manifest.json"


def bump(v):
    return [v[0], v[1], v[2] + 1]


def main():
    bp = json.loads(BP_MANIFEST.read_text())
    rp = json.loads(RP_MANIFEST.read_text())

    new_bp_version = bump(bp["header"]["version"])
    new_rp_version = bump(rp["header"]["version"])

    bp["header"]["version"] = new_bp_version
    for m in bp["modules"]:
        m["version"] = new_bp_version
    for d in bp["dependencies"]:
        d["version"] = new_rp_version

    rp["header"]["version"] = new_rp_version
    for m in rp["modules"]:
        m["version"] = new_rp_version
    for d in rp["dependencies"]:
        d["version"] = new_bp_version

    BP_MANIFEST.write_text(json.dumps(bp, indent=2, ensure_ascii=False) + "\n")
    RP_MANIFEST.write_text(json.dumps(rp, indent=2, ensure_ascii=False) + "\n")

    print(f"BP: {new_bp_version}, RP: {new_rp_version}")


if __name__ == "__main__":
    main()
