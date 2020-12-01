#現在のスロットを取得
execute as @s store result score #slot ui_slot run data get entity @s SelectedItemSlot

#前のtickのスロットと比較して、違ったらタグを付与
execute unless score @s ui_slot = #slot ui_slot run tag @s add slot_move
execute unless score @s ui_slot = #slot ui_slot run scoreboard players operation @s ui_slot_before = @s ui_slot

#スコアリセット
scoreboard players reset #slot

#現在のスロットを記録
function rpg:right_click_ui/slot_move/slot_get