#!/usr/bin/env python3
"""Erhoeht die Version in BP/RP-Manifest um 1 (Header, Module,
Dependencies und Pack-Name) und baut danach dist/<Name>_v<Version>.mcaddon.
So erkennt Minecraft jeden neuen Import als Update."""
import json
import re
import zipfile
from pathlib import Path


class AddonBuilder:
    ROOT = Path(__file__).resolve().parent.parent
    DIST_NAME = "EndLordBoss"
    PACKS = ("BP", "RP")

    def __init__(self):
        self.manifests = {p: self.ROOT / p / "manifest.json" for p in self.PACKS}

    def bump(self):
        data = {p: json.loads(f.read_text()) for p, f in self.manifests.items()}
        old = data["BP"]["header"]["version"]
        new = [old[0], old[1], old[2] + 1]
        label = ".".join(map(str, new))
        for pack, m in data.items():
            m["header"]["version"] = new
            m["header"]["name"] = re.sub(r"( v[\d.]+)?$", f" v{label}", m["header"]["name"], count=1)
            for mod in m["modules"]:
                mod["version"] = new
            for dep in m.get("dependencies", []):
                dep["version"] = new
            self.manifests[pack].write_text(json.dumps(m, indent=2, ensure_ascii=False) + "\n")
        return label

    def package(self, label):
        dist = self.ROOT / "dist"
        dist.mkdir(exist_ok=True)
        for old in dist.glob("*.mcaddon"):
            old.unlink()
        target = dist / f"{self.DIST_NAME}_v{label}.mcaddon"
        with zipfile.ZipFile(target, "w", zipfile.ZIP_DEFLATED) as z:
            for pack in self.PACKS:
                for f in sorted((self.ROOT / pack).rglob("*")):
                    if f.is_file() and not f.name.startswith("."):
                        z.write(f, f.relative_to(self.ROOT).as_posix())
        return target

    def run(self):
        label = self.bump()
        target = self.package(label)
        print(f"Version {label} -> {target.relative_to(self.ROOT)}")


if __name__ == "__main__":
    AddonBuilder().run()
