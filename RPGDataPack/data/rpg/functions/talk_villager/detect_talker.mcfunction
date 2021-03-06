#村人のヒットボックスの中に入った時にタグ付与
execute as @e[tag=villager_can_talk,tag=!villager_trade_changed,dx=0] positioned ~-0.99 ~-0.99 ~-0.99 if entity @s[dx=0] run tag @s add target
#名前変更
execute as @e[tag=target] at @s run function rpg:talk_villager/set_script

#もし話しかけたプレイヤーが依頼書を持っていた場合request_hubを実行
execute if entity @e[tag=target] if data entity @s SelectedItem{tag:{request:true}} run function rpg:request/request_hub

#再帰
execute if entity @s[distance=..5] positioned ^ ^ ^0.5 unless entity @e[tag=target] run function rpg:talk_villager/detect_talker

#タグ削除
tag @e[tag=target] remove target
