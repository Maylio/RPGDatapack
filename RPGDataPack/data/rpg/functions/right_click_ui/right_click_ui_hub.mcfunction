
#"ui_shift"が2かつ下を向いていた時におなじIDのロバが居なければロバを召喚してIDを振り分け
execute as @s[scores={ui_shift=1},tag=!ui_opener] at @s run function rpg:right_click_ui/summon

#"look_move_hub"で視線を動かしているか検知する
execute as @s[scores={ui_shift_toggle=0,ui_shift=2..},tag=!look_move,tag=!look_move_first] run function rpg:right_click_ui/look_move/look_get
execute as @s[scores={ui_shift_toggle=0,ui_shift=2..},tag=!look_move] run function rpg:right_click_ui/look_move/look_move_hub

#スコア比較のためにtpさせるプレイヤーにタグ付け
tag @s add tp_player
#シフトをしているときにIDが同じロバをプレイヤーにtp
execute as @s[scores={ui_shift=1..,ui_shift_toggle=1}] at @s as @e[tag=ui_donkey] if score @s setid_number = @a[tag=tp_player,limit=1] setid_number run tp @s ~ ~1 ~
#シフトをしていないときにIDが同じロバをプレイヤーの真下にtp
execute as @s[scores={ui_shift=1..,ui_shift_toggle=0}] at @s as @e[tag=ui_donkey] if score @s setid_number = @a[tag=tp_player,limit=1] setid_number run tp @s ~ ~-7 ~
#タグはく奪
tag @s remove tp_player

#プレイヤーの"ui_shift_toggle"を0に設定
scoreboard players set @s ui_shift_toggle 0

#"look_move"が付いたプレイヤーのシフトをリセット
execute as @s[tag=look_move] at @s run scoreboard players reset @s ui_shift