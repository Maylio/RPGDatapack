##注意##このファンクションには問題が複数残っていますが、対処の難易度が高く、対処すると他の部分に支障がでる可能性があるので更新はされません

#"slot_move_hub"でスロットを動かしているか検知する
execute as @a[scores={ui_shift=2..},tag=!slot_move,tag=!slot_move_first] run function rpg:right_click_ui/slot_move/slot_get
execute as @a[scores={ui_shift=2..},tag=!slot_move] run function rpg:right_click_ui/slot_move/slot_move_hub

#バックパックを持っていなかったらスコアをリセット
execute as @a unless entity @s[nbt={SelectedItem:{tag:{backpack:true}}}] run scoreboard players reset @s ui_shift
execute as @a unless entity @s[nbt={SelectedItem:{tag:{backpack:true}}}] run scoreboard players reset @s ui_shift_toggle

#プレイヤーがロバに乗った時にアイテムを削除
execute as @a[tag=ui_opener,scores={ui_ride=1..}] at @s run function rpg:backpack/clear_backpack
scoreboard players reset @a ui_ride

#バックパックを持っている時にシフト+右クリック検知を実行
execute as @a if entity @s[nbt={SelectedItem:{tag:{backpack:true}}}] at @s run function rpg:right_click_ui/right_click_ui_hub
#召喚されたロバにバックパックの中身を代入
execute as @a if entity @s[nbt={SelectedItem:{tag:{backpack:true}}},scores={ui_shift=1}] at @s run function rpg:backpack/load


#"clear_backpack"が付いたプレイヤーが開いているバックパックをセーブ
execute as @a[tag=clear_backpack] at @s run function rpg:backpack/save
#スロット、視線を動かすか、バックパックを持っていないことを検知したときにアイテムを削除(ゴーストアイテム対策にtickをずらしている)
execute as @a[tag=ui_opener] unless entity @s[nbt={SelectedItem:{tag:{backpack:true}}}] at @s run function rpg:backpack/clear_backpack
execute as @a[tag=look_move,tag=ui_opener] at @s run function rpg:backpack/clear_backpack
execute as @a[tag=slot_move,tag=ui_opener] at @s run function rpg:backpack/clear_backpack

#タグはく奪
tag @a[tag=look_move] remove look_move
tag @a[tag=slot_move] remove slot_move

#uiを開いているプレイヤーが居なくてロバがいるとき"kill"を実行
execute unless entity @a[tag=ui_opener] if entity @e[tag=ui_donkey] run tp @e[tag=ui_donkey] ~ ~-1000 ~

