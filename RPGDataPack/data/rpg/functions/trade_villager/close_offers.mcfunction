#NoAIの場合タグをつけてfalseに変更
execute if entity @s[scores={close_gui_tick=1},nbt={NoAI:true}] run tag @s add villager_noai
execute if entity @s[scores={close_gui_tick=1},tag=villager_noai] run data modify entity @s Motion[0] set value 0.0d
execute if entity @s[scores={close_gui_tick=1},tag=villager_noai] run data modify entity @s Motion[1] set value 0.0d
execute if entity @s[scores={close_gui_tick=1},tag=villager_noai] run data modify entity @s Motion[2] set value 0.0d
execute if entity @s[scores={close_gui_tick=1},tag=villager_noai] run data modify entity @s NoAI set value false
#職業をはく奪(これでGUIが閉じる)
execute if entity @s[scores={close_gui_tick=1}] run data merge entity @s {VillagerData:{profession:"minecraft:none"}}


#インベントリから職業データを引き出す
execute if entity @s[scores={close_gui_tick=2}] run data modify entity @s VillagerData set from entity @s Inventory[0].tag.VillagerData
#NoAIの設定をもとに戻す
execute if entity @s[scores={close_gui_tick=2},tag=villager_noai] run data modify entity @s NoAI set value true
execute if entity @s[scores={close_gui_tick=2},tag=villager_noai] run tag @s remove villager_noai


#スコア管理
scoreboard players add @s close_gui_tick 1
scoreboard players reset @s[scores={close_gui_tick=3..}] close_gui_tick