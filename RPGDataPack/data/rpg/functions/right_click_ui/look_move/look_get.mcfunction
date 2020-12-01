execute as @s store result score @s ui_look_x run data get entity @s Rotation[0]
execute as @s store result score @s ui_look_y run data get entity @s Rotation[1]

tag @s[tag=!look_move_first] add look_move_first