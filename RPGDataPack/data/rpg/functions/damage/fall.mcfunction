scoreboard players operation #fall_distance damage_fall = @s damage_fall

scoreboard players set #3 damage_fall 3
scoreboard players operation #fall_distance damage_fall -= #3 damage_fall

scoreboard players set #100 damage_fall 100
scoreboard players operation #fall_distance damage_fall *= #100 damage_fall

execute store result score #Health damage_fall run data get entity @s Health 100
scoreboard players operation #Health damage_fall -= #fall_distance damage_fall

execute if entity @s[type=player] if score #Health damage_fall matches ..0 run kill @s
execute if entity @s[type=player] if score #Health damage_fall matches 1.. run scoreboard players operation @s ScoreToHealth = #Health damage_fall

execute if entity @s[type=!player] store result entity @s Health float 0.01 run scoreboard players get #Health damage_fall

scoreboard players reset #3
scoreboard players reset #100
scoreboard players reset #fall_distance
scoreboard players reset #Health