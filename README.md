# Minecraft Boss Add-on: Endboss

Standard-Bedrock-Add-on mit eigenem Boss **Endboss** (`wedel:endboss`). Neustart auf Basis des Blockbench-Modells `blockbench/endboss_end_design_v2.bbmodel`.

## Struktur (Ordner)

- `BP/` – Behavior Pack (Stats, KI, Loot, Boss-Leiste)
- `RP/` – Resource Pack (Modell, Textur, Animationen, Spawn-Ei, Übersetzungen)
- `blockbench/` – Quell-Modell (`.bbmodel`) zum Weiterbearbeiten in Blockbench
- `dist/Endboss.mcaddon` – fertige Datei zum Download/Import
- `scripts/bump_version.py` – Versionen in beiden Manifesten erhöhen

## Boss (Grundversion)

- 200 HP, Boss-Health-Bar (verdunkelt den Himmel)
- Nahkampf: 12 Schaden pro Treffer
- Greift Spieler im Umkreis von 40 Blöcken an
- Loot: Smaragde

## Modell & Animationen

- Bones (aus den Cubes des `.bbmodel` gebildet): `body`, `head`, `left_arm`, `right_arm`, `left_leg`, `right_leg`
- **Idle**: leichtes Wippen + Kopfbewegung
- **Walk**: Arm-/Beinschwung ab `query.modified_move_speed > 0.05`
- **Attack**: Armschlag nach vorn über `query.attack_time`

## Testen auf Android

1. `dist/Endboss.mcaddon` aufs Gerät übertragen und antippen → Import in Minecraft
2. In den Welteinstellungen "Endboss (BP)" und "Endboss (RP)" aktivieren, **Cheats aktivieren**
3. Spawnen: `/summon wedel:endboss` oder per Spawn-Ei

## Versionierung

Minecraft erkennt ein erneutes `.mcaddon` nur als Update, wenn die Version in beiden Manifesten erhöht wurde. Vor jedem neuen Build:

```bash
python3 scripts/bump_version.py
```

## Add-on neu bauen

```bash
rm -f dist/Endboss.mcaddon
zip -r dist/Endboss.mcaddon BP RP -x ".*"
```
