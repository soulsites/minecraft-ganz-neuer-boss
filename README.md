# Minecraft Boss Add-on: End Lord

Standard-Bedrock-Add-on mit eigenem Boss **End Lord** (`wedel:end_lord`) auf Basis des Blockbench-Modells `blockbench/end_lord_boss.bbmodel`.

## Struktur (Ordner)

- `BP/` – Behavior Pack (Stats, KI, Loot, Boss-Leiste)
- `RP/` – Resource Pack (Modell, Textur, Animationen, Spawn-Ei, Übersetzungen)
- `blockbench/` – Quell-Modell (`.bbmodel`) zum Weiterbearbeiten in Blockbench
- `dist/EndLordBoss_v<Version>.mcaddon` – fertige Datei zum Download/Import
- `scripts/build.py` – Version +1 und `.mcaddon` bauen

## Boss (Grundversion)

- 200 HP, Boss-Health-Bar (verdunkelt den Himmel)
- Nahkampf: 12 Schaden pro Treffer
- Greift Spieler im Umkreis von 40 Blöcken an
- Loot: Smaragde

## Modell & Animationen

- Bones (aus den Cubes des `.bbmodel` gebildet): `body`, `crown`, `left_arms`, `right_arms` (je 3 Void-Arme mit Endstein-Fäusten)
- Modell um 10 Pixel angehoben, damit der Schwanz-Edelstein nicht im Boden steckt
- **Idle**: Schweben + Kronen-Drehung + Armwippen
- **Walk**: Vorneigen + Armschwung ab `query.modified_move_speed > 0.05`
- **Attack**: Arme schlagen nach vorn über `query.attack_time`

## Testen auf Android

1. `dist/EndLordBoss_v<Version>.mcaddon` aufs Gerät übertragen und antippen → Import in Minecraft
2. In den Welteinstellungen "End Lord Boss (BP) v…" und "End Lord Boss (RP) v…" aktivieren, **Cheats aktivieren**
3. Spawnen: `/summon wedel:end_lord` oder per Spawn-Ei

## Versionierung & Bauen

Minecraft erkennt ein erneutes `.mcaddon` nur als Update, wenn die Version höher ist. Deshalb **vor jedem neuen Import**:

```bash
python3 scripts/build.py
```

- erhöht die Version in beiden Manifesten um 1 (Header, Module, Dependencies)
- schreibt die Version in den Pack-Namen (z.B. „End Lord Boss (BP) v1.0.1“), damit man sie in Minecraft erkennt
- baut `dist/EndLordBoss_v<Version>.mcaddon` und löscht ältere Builds
