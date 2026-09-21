# Minecraft Boss Add-on: Void Reaper

Standard-Bedrock-Add-on mit eigenem Boss **Void Reaper** (`wedel:void_reaper`), der im **End** in der Struktur **Endfestung** haust.

## Struktur (Ordner)

- `BP/` – Behavior Pack (Stats, KI/Fähigkeiten, Loot, Boss-Leiste, Endfestung-Funktion)
- `RP/` – Resource Pack (Modell, Textur, Spawn-Ei, Übersetzungen)
- `dist/VoidReaperBoss.mcaddon` – fertige Datei zum Download/Import

## Boss-Fähigkeiten

- **Nahkampf**: 12 Schaden pro Treffer (Grundphase)
- **Fernkampf ("Void-Pfeile")**: schießt Pfeile bis auf 25 Blöcke Entfernung – trifft dich also auch, wenn du dich hochbaust und mit dem Bogen schießt
- **Sprungangriff**: springt gezielt zum Ziel, auch auf kleine Erhöhungen/Türme
- **Wut-Phase (ab 50 % HP)**: wird schneller, macht mehr Schaden (18 statt 12), schießt schneller und in Salven (3 Pfeile)
- **Flächenangriff** (nur Wut-Phase): trifft alle Spieler im Nahbereich gleichzeitig – bestraft dichtes Herumstehen
- 200 HP, Boss-Health-Bar (verdunkelt den Himmel), Loot: Netherite-Schrott + Smaragde

Reines Hochbauen + Dauerbeschuss mit dem Bogen reicht also nicht mehr aus – der Boss schießt zurück und kann zu dir hochspringen.

## Die Struktur: Endfestung

- Liegt im **End** (thematisch passend zum Void-Reaper-Boss)
- Wird per Funktion direkt um den Spieler herum gebaut: End-Stein-Ziegel-Mauern, 4 Purpur-Ecktürme mit End-Ruten als Leuchtfeuer, Zinnen, eine Obsidian-Arena-Plattform in der Mitte
- Der Void Reaper **spawnt automatisch** in der Mitte der Endfestung, sobald die Struktur gebaut wird – es gibt aktuell keinen anderen Weg, an den Boss zu kommen (kein natürliches Spawnen), er ist also fest an die Endfestung gebunden

### Endfestung bauen & Boss spawnen

1. Ins **End** reisen (Enderauge/Endportal) und **Cheats aktivieren**
2. An einer möglichst freien Stelle (nicht direkt auf einer Obsidian-Säule) stehen
3. Befehl ausführen: `/function endfestung_bauen`
4. Die Arena wird um dich herum gebaut, danach erscheint der Void Reaper in der Mitte

Die Funktion räumt vorher den Baubereich frei (21×14×21 Blöcke), du kannst sie also auch mehrfach ausführen, um die Arena neu zu bauen.

## Testen auf Android

1. `dist/VoidReaperBoss.mcaddon` auf das Android-Gerät übertragen (z.B. per Cloud-Ordner, USB, E-Mail an dich selbst)
2. Datei antippen → öffnet sich automatisch in Minecraft und importiert BP + RP
3. In den Welteinstellungen eines neuen/bestehenden Welt-Editors:
   - Behavior Pack "Void Reaper Boss (BP)" aktivieren
   - Resource Pack "Void Reaper Boss (RP)" aktivieren
   - **Cheats aktivieren** (nötig für `/function endfestung_bauen` und `/summon`)
4. Welt starten, ins End reisen, `/function endfestung_bauen` ausführen und den Boss testen

## Animationen

Eigene Animationen statt Standardpose (`RP/animations/`, `RP/animation_controllers/`):

- **Idle**: leichtes Auf-und-Ab-Wippen + Kopfbewegung
- **Walk**: Arm-/Beinschwung, aktiviert automatisch ab `query.modified_move_speed > 0.05`
- **Attack**: Armschwung nach vorn, gesteuert über `query.attack_time` (läuft bei jedem Angriff)

## Versionierung (wichtig für den Import auf dem Handy!)

Minecraft erkennt ein erneutes `.mcaddon` nur als Update, wenn sich die Version in `BP/manifest.json` und `RP/manifest.json` erhöht hat – bei gleicher Version wird der Import sonst ignoriert oder schlägt fehl. Deshalb vor jedem neuen Build:

```bash
python3 scripts/bump_version.py
```

Das erhöht Header-, Modul- und Dependency-Version in beiden Manifesten synchron um 1 (aktuell: `1.0.1`). Danach wie gewohnt neu zippen.

## Weiterentwicklung (nächste Schritte)

- Eigenes Icon (`pack_icon.png`) für beide Packs
- Weitere Phasen/Angriffe (z.B. Teleportation, Void-Projektile statt Standard-Pfeile)
- Eigene Textur/Modell verfeinern (aktuell ein einfaches Platzhalter-Design)
- Natürliches Erscheinen der Endfestung bei der Weltgenerierung (aktuell bewusst nur per Funktion, damit es zuverlässig auf dem Handy testbar bleibt)

## Add-on neu bauen (falls Dateien geändert werden)

```bash
cd /home/user/minecraft-ganz-neuer-boss
rm -f dist/VoidReaperBoss.mcaddon
zip -r dist/VoidReaperBoss.mcaddon BP RP -x ".*"
```
