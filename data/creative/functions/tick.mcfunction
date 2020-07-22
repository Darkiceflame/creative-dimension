scoreboard players enable @a dimwarp
scoreboard players enable @a overworld
scoreboard players enable @a creative

tellraw @a[scores={dimwarp=1..}] [{"text":"[Server] ","color":"green"},{"text":"Choose a dimension. ","color":"white"},{"text":"(This will remove any active potion effects.)\n","color":"white"},{"text":"- Overworld\n","color":"green","clickEvent":{"action":"run_command","value":"/trigger overworld"}},{"text":"- Creative Dimension","color":"yellow","clickEvent":{"action":"run_command","value":"/trigger creative"}}]

tellraw @a[scores={overworld=1..},nbt=!{Inventory:[]}] [{"text":"[Server] ","color":"green"},{"text":"You must have an empty inventory to travel to this dimension!","color":"white"}]
tellraw @a[scores={overworld=1..},nbt={Dimension:"minecraft:overworld"}] [{"text":"[Server] ","color":"green"},{"text":"You are already in that dimension!","color":"white"}]
tellraw @a[scores={overworld=1..,warpCooldown=1..}] [{"text":"[Server] ","color":"green"},{"text":"You can warp again in ","color":"white"},{"score":{"name":"*","objective":"warpCooldown"},"color":"yellow"},{"text":" ticks","color":"white"}]
scoreboard players set @a[scores={overworld=1..},nbt={Dimension:"minecraft:overworld"}] overworld 0
execute at @a[scores={overworld=1..,warpCooldown=0},nbt={Inventory:[]}] in minecraft:overworld run tp @p ~ ~ ~
execute at @a[scores={overworld=1..,warpCooldown=0},nbt={Inventory:[]}] run spreadplayers ~ ~ 0 1 false @p
scoreboard players set @a[scores={overworld=1..,warpCooldown=0},nbt={Dimension:"minecraft:overworld"}] warpCooldown 200
effect clear @a[scores={creative=1..}]

tellraw @a[scores={creative=1..},nbt=!{Inventory:[]}] [{"text":"[Server] ","color":"green"},{"text":"You must have an empty inventory to travel to this dimension!","color":"white"}]
tellraw @a[scores={creative=1..},nbt={Dimension:"creative:creative_dimension"}] [{"text":"[Server] ","color":"green"},{"text":"You are already in that dimension!","color":"white"}]
tellraw @a[scores={creative=1..,warpCooldown=1..}] [{"text":"[Server] ","color":"green"},{"text":"You can warp again in ","color":"white"},{"score":{"name":"*","objective":"warpCooldown"},"color":"yellow"},{"text":" ticks","color":"white"}]
scoreboard players set @a[scores={creative=1..},nbt={Dimension:"creative:creative_dimension"}] overworld 0
execute at @a[scores={creative=1..,warpCooldown=0},nbt={Inventory:[]}] in creative:creative_dimension run tp @p ~ ~ ~
execute at @a[scores={creative=1..,warpCooldown=0},nbt={Inventory:[]}] run spreadplayers ~ ~ 0 1 false @p
scoreboard players set @a[scores={creative=1..,warpCooldown=0},nbt={Dimension:"creative:creative_dimension"}] warpCooldown 200
effect clear @a[scores={creative=1..}]

scoreboard players set @a dimwarp 0
scoreboard players set @a overworld 0
scoreboard players set @a creative 0
scoreboard players remove @a[scores={warpCooldown=1..}] warpCooldown 1

gamemode survival @a[name=!Darkiceflame42,nbt={Dimension:"minecraft:overworld"}]
gamemode creative @a[name=!Darkiceflame42,nbt={Dimension:"creative:creative_dimension"}]

title @a[scores={warpCooldown=1..}] actionbar {"text":"Dimension Warp is on cooldown","color":"white"}
