#プレイヤーのスコアに現在のスロットを代入
execute as @s store result score @s ui_slot run data get entity @s SelectedItemSlot

#もし初めての代入の場合タグを付与
tag @s[tag=!slot_move_first] add slot_move_first