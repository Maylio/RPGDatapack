summon area_effect_cloud ^ ^ ^1 {Duration:1,Radius:0f,Tags:[pos]}

#X軸
execute as @s store result score @s move_pos run data get entity @s Pos[0] 100
execute as @e[tag=pos] store result score @s move_pos run data get entity @s Pos[0] 100

scoreboard players operation @s move_pos -= @e[tag=pos] move_pos
execute as @s store result entity @s Motion[0] double -0.005 run scoreboard players get @s move_pos

#Y軸
execute as @s store result score @s move_pos run data get entity @s Pos[1] 100
execute as @e[tag=pos] store result score @s move_pos run data get entity @s Pos[1] 100

scoreboard players operation @s move_pos -= @e[tag=pos] move_pos
execute as @s store result entity @s Motion[1] double -0.005 run scoreboard players get @s move_pos

#Z軸
execute as @s store result score @s move_pos run data get entity @s Pos[2] 100
execute as @e[tag=pos] store result score @s move_pos run data get entity @s Pos[2] 100

scoreboard players operation @s move_pos -= @e[tag=pos] move_pos
execute as @s store result entity @s Motion[2] double -0.005 run scoreboard players get @s move_pos

scoreboard players reset @s move_pos

kill @e[tag=pos]
tag @s remove squid_bullet_unset