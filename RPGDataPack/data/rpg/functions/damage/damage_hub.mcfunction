execute as @e[tag=conbat_mob,nbt={OnGround:1b}] if score @s damage_fall matches 4.. run function rpg:damage/fall
scoreboard players reset @e[tag=conbat_mob] damage_fall
execute as @e[tag=conbat_mob,nbt=!{FallDistance:0.0f},nbt=!{OnGround:1b}] store result score @s damage_fall run data get entity @s FallDistance


execute as @a[nbt={OnGround:1b},gamemode=!creative,gamemode=!spectator] if score @s damage_fall matches 4.. run function rpg:damage/fall
scoreboard players reset @a damage_fall
execute as @a[nbt=!{FallDistance:0.0f},nbt=!{OnGround:1b},gamemode=!creative,gamemode=!spectator] store result score @s damage_fall run data get entity @s FallDistance

