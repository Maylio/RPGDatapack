execute as @s at @s run setblock ~ ~100 ~ shulker_box replace

execute as @s at @s run loot replace block ~ ~100 ~ container.0 loot setid:number
execute as @s at @s store result score #0 setid_number run data get block ~ ~100 ~ Items[].tag.Random
execute as @s at @s run replaceitem block ~ ~100 ~ container.0 air
execute as @s at @s run loot replace block ~ ~100 ~ container.0 loot setid:number2
execute as @s at @s store result score #10 setid_number run data get block ~ ~100 ~ Items[].tag.Random
execute as @s at @s run replaceitem block ~ ~100 ~ container.0 air
execute as @s at @s run loot replace block ~ ~100 ~ container.0 loot setid:number3
execute as @s at @s store result score #100 setid_number run data get block ~ ~100 ~ Items[].tag.Random
execute as @s at @s run replaceitem block ~ ~100 ~ container.0 air
execute as @s at @s run loot replace block ~ ~100 ~ container.0 loot setid:number4
execute as @s at @s store result score #1000 setid_number run data get block ~ ~100 ~ Items[].tag.Random
execute as @s at @s run replaceitem block ~ ~100 ~ container.0 air

execute as @s at @s run scoreboard players operation #0 setid_number += #10 setid_number
execute as @s at @s run scoreboard players operation #0 setid_number += #100 setid_number
execute as @s at @s run scoreboard players operation #0 setid_number += #1000 setid_number

scoreboard players operation @s setid_number = #0 setid_number

scoreboard players reset #0
scoreboard players reset #10
scoreboard players reset #100
scoreboard players reset #1000

execute as @s at @s run setblock ~ ~100 ~ air replace

execute as @s at @s run tag @s add setid_test
execute as @e[tag=!setid_test] if score @s setid_number = @e[tag=setid_test,limit=1] setid_number as @e[tag=setid_test] at @s run function setid:set
execute as @s at @s run tag @s remove setid_test 