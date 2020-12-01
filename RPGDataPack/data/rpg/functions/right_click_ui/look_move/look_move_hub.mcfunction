execute as @s store result score #look ui_look_x run data get entity @s Rotation[0]
execute as @s store result score #look ui_look_y run data get entity @s Rotation[1]

execute unless score @s ui_look_x = #look ui_look_x run tag @s add look_move
execute unless score @s ui_look_y = #look ui_look_y run tag @s add look_move

scoreboard players reset #look

function rpg:right_click_ui/look_move/look_get