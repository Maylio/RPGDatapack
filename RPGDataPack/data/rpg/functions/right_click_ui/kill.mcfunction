#実行者とスコアが同じロバのチェストをはずす
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=killer,limit=1] setid_number run data modify entity @s ChestedHorse set value false
#実行者とスコアが同じロバをkill
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=killer,limit=1] setid_number run kill @s
#全てリセット
scoreboard players reset @s ui_shift
scoreboard players reset @s ui_shift_toggle
scoreboard players reset @s ui_slot
scoreboard players reset @s ui_slot_before
scoreboard players reset @s ui_look_x
scoreboard players reset @s ui_look_y
scoreboard players reset @s setid_number
tag @s remove killer
tag @s remove ui_opener
tag @s remove look_move_first
tag @s remove slot_move_first