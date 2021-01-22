#村人のヒットボックスの中に入った時にタグ付与
execute as @e[tag=villager_can_talk,tag=!villager_trade_changed,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run tag @s add target
#名前変更
execute as @e[tag=target] at @s run function rpg:talk_villager/set_script


#再起
execute if entity @s[distance=..5] positioned ^ ^ ^0.5 unless entity @e[tag=target] run function rpg:talk_villager/detect_talker

#タグ削除
tag @e[tag=target] remove target
