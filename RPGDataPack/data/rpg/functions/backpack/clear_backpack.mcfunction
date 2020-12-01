#もしも実行者の近くにバックパックがアイテムとしてある時、削除する
kill @e[type=item,nbt={Item:{tag:{backpack:true}},Age:0s},limit=1,sort=nearest]
#バックパックを持っているとき、持っているアイテムを削除
execute if entity @s[nbt={SelectedItem:{tag:{backpack:true}}},tag=!slot_move] run replaceitem entity @s weapon.mainhand air 1
#スロット変更した場合、変える前のスロットにあるバックパックを削除
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 0 run replaceitem entity @s hotbar.0 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 1 run replaceitem entity @s hotbar.1 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 2 run replaceitem entity @s hotbar.2 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 3 run replaceitem entity @s hotbar.3 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 4 run replaceitem entity @s hotbar.4 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 5 run replaceitem entity @s hotbar.5 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 6 run replaceitem entity @s hotbar.6 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 7 run replaceitem entity @s hotbar.7 air
execute if entity @s[tag=slot_move] if score @s ui_slot_before matches 8 run replaceitem entity @s hotbar.8 air
#タグ付け
tag @s add clear_backpack