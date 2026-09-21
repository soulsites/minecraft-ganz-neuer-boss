# Minecraft Boss Add-on: Void Reaper

Standard-Bedrock-Add-on mit einem eigenen Boss: **Void Reaper** (`wedel:void_reaper`).

## Struktur

- `BP/` – Behavior Pack (Stats, KI, Loot, Boss-Leiste)
- `RP/` – Resource Pack (Modell, Textur, Spawn-Ei, Übersetzungen)
- `dist/VoidReaperBoss.mcaddon` – fertige Datei zum Download/Import

## Boss-Eckdaten

- 200 HP, Nahkampf (12 Schaden), Boss-Health-Bar (verdunkelt den Himmel)
- Loot: Netherite-Schrott + Smaragde
- Spawn-Ei: "Void Reaper Spawn Ei" (im Kreativ-Inventar)
- Spawnen per Befehl: `/summon wedel:void_reaper`

## Testen auf Android

1. `dist/VoidReaperBoss.mcaddon` auf das Android-Gerät übertragen (z.B. per Cloud-Ordner, USB, E-Mail an dich selbst).
2. Datei antippen → öffnet sich automatisch in Minecraft und importiert BP + RP.
3. In den Welteinstellungen eines neuen/bestehenden Welt-Editors:
   - Behavior Pack "Void Reaper Boss (BP)" aktivieren
   - Resource Pack "Void Reaper Boss (RP)" aktivieren
   - **Cheats aktivieren**, um `/summon wedel:void_reaper` nutzen zu können
4. Welt starten und Boss per Spawn-Ei oder Befehl testen.

## Weiterentwicklung (nächste Schritte)

- Eigene Angriffsmuster (Fernkampf, Phasen bei niedriger HP) über `component_groups` + Events
- Individuelle Animationen (`animations/` + `animation_controllers/`) statt Standardpose
- Eigenes Icon (`pack_icon.png`) für beide Packs
- Spawn-Regeln (`BP/spawn_rules/`) für natürliches Spawnen in bestimmten Biomen
- Eigene Textur/Modell verfeinern (aktuell ein einfaches Platzhalter-Design)

## Add-on neu bauen (falls Dateien geändert werden)

```bash
cd dist && rm -f VoidReaperBoss.mcaddon && zip -r VoidReaperBoss.mcaddon ../BP ../RP -x ".*"
```

(oder wie im Repo: `zip -r dist/VoidReaperBoss.mcaddon BP RP -x ".*"` vom Projekt-Root aus)
