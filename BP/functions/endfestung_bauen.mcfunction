# Endfestung - baut die Void-Reaper-Boss-Arena im End um den Spieler herum
tellraw @s {"rawtext":[{"text":"§5Die Endfestung erhebt sich aus der Leere...§r"}]}
fill ~-10 ~-1 ~0 ~10 ~12 ~20 air
fill ~-10 ~-1 ~0 ~10 ~-1 ~20 end_stone
fill ~-1 ~-1 ~9 ~1 ~-1 ~11 obsidian
fill ~-1 ~0 ~9 ~1 ~0 ~11 obsidian
setblock ~-1 ~0 ~9 crying_obsidian
setblock ~-1 ~0 ~11 crying_obsidian
setblock ~1 ~0 ~9 crying_obsidian
setblock ~1 ~0 ~11 crying_obsidian
fill ~-10 ~0 ~0 ~10 ~7 ~0 end_bricks
fill ~-10 ~0 ~20 ~10 ~7 ~20 end_bricks
fill ~-10 ~0 ~0 ~-10 ~7 ~20 end_bricks
fill ~10 ~0 ~0 ~10 ~7 ~20 end_bricks
fill ~-1 ~0 ~0 ~1 ~3 ~0 air
fill ~-10 ~0 ~0 ~-10 ~11 ~0 purpur_pillar ["pillar_axis"="y"]
setblock ~-10 ~12 ~0 end_rod ["facing_direction"=1]
fill ~10 ~0 ~0 ~10 ~11 ~0 purpur_pillar ["pillar_axis"="y"]
setblock ~10 ~12 ~0 end_rod ["facing_direction"=1]
fill ~-10 ~0 ~20 ~-10 ~11 ~20 purpur_pillar ["pillar_axis"="y"]
setblock ~-10 ~12 ~20 end_rod ["facing_direction"=1]
fill ~10 ~0 ~20 ~10 ~11 ~20 purpur_pillar ["pillar_axis"="y"]
setblock ~10 ~12 ~20 end_rod ["facing_direction"=1]
setblock ~-8 ~8 ~0 purpur_block
setblock ~-8 ~8 ~20 purpur_block
setblock ~-6 ~8 ~0 purpur_block
setblock ~-6 ~8 ~20 purpur_block
setblock ~-4 ~8 ~0 purpur_block
setblock ~-4 ~8 ~20 purpur_block
setblock ~-2 ~8 ~0 purpur_block
setblock ~-2 ~8 ~20 purpur_block
setblock ~0 ~8 ~0 purpur_block
setblock ~0 ~8 ~20 purpur_block
setblock ~2 ~8 ~0 purpur_block
setblock ~2 ~8 ~20 purpur_block
setblock ~4 ~8 ~0 purpur_block
setblock ~4 ~8 ~20 purpur_block
setblock ~6 ~8 ~0 purpur_block
setblock ~6 ~8 ~20 purpur_block
setblock ~8 ~8 ~0 purpur_block
setblock ~8 ~8 ~20 purpur_block
setblock ~-10 ~8 ~2 purpur_block
setblock ~10 ~8 ~2 purpur_block
setblock ~-10 ~8 ~4 purpur_block
setblock ~10 ~8 ~4 purpur_block
setblock ~-10 ~8 ~6 purpur_block
setblock ~10 ~8 ~6 purpur_block
setblock ~-10 ~8 ~8 purpur_block
setblock ~10 ~8 ~8 purpur_block
setblock ~-10 ~8 ~10 purpur_block
setblock ~10 ~8 ~10 purpur_block
setblock ~-10 ~8 ~12 purpur_block
setblock ~10 ~8 ~12 purpur_block
setblock ~-10 ~8 ~14 purpur_block
setblock ~10 ~8 ~14 purpur_block
setblock ~-10 ~8 ~16 purpur_block
setblock ~10 ~8 ~16 purpur_block
setblock ~-10 ~8 ~18 purpur_block
setblock ~10 ~8 ~18 purpur_block
fill ~-5 ~0 ~5 ~-5 ~5 ~5 purpur_pillar ["pillar_axis"="y"]
setblock ~-5 ~6 ~5 end_rod ["facing_direction"=1]
fill ~-5 ~0 ~15 ~-5 ~5 ~15 purpur_pillar ["pillar_axis"="y"]
setblock ~-5 ~6 ~15 end_rod ["facing_direction"=1]
fill ~5 ~0 ~5 ~5 ~5 ~5 purpur_pillar ["pillar_axis"="y"]
setblock ~5 ~6 ~5 end_rod ["facing_direction"=1]
fill ~5 ~0 ~15 ~5 ~5 ~15 purpur_pillar ["pillar_axis"="y"]
setblock ~5 ~6 ~15 end_rod ["facing_direction"=1]
summon wedel:void_reaper ~ ~2 ~10
tellraw @a {"rawtext":[{"text":"§4Der Void Reaper erwacht in der Endfestung!§r"}]}
