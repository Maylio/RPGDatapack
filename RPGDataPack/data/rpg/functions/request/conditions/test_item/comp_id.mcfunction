#依頼書の条件のItem_IDをスコア化
execute store result score #request_id request_calc run data get entity @s SelectedItem.tag.request_step[0].conditions.Item_ID
#左手のアイテムのIDをスコア化
execute store result score #target_id request_calc run data get entity @s Inventory[{Slot:-106b}].tag.Item_ID

#依頼書の指定アイテムをスコア化
execute store result score #request_count request_calc run data get entity @s SelectedItem.tag.request_step[0].conditions.Item_Count
#左手のアイテムの数をスコア化
execute store result score #target_count request_calc run data get entity @s Inventory[{Slot:-106b}].Count

#依頼書の条件のVillager_IDをスコア化
execute store result score #request_villager request_calc run data get entity @s SelectedItem.tag.request_step[0].conditions.Villager_ID
#村人のIDをスコア化
execute store result score #target_villager request_calc run data get entity @e[tag=target,limit=1] Inventory[0].tag.Villager_ID

#比較して一致していた場合報酬を与える
execute if score #request_id request_calc = #target_id request_calc if score #request_count request_calc = #target_count request_calc if score #request_villager request_calc = #target_villager request_calc at @s run function rpg:request/reward/rewards

#スコア管理
scoreboard players reset #target_id
scoreboard players reset #request_id
scoreboard players reset #target_count
scoreboard players reset #request_count
scoreboard players reset #target_villager
scoreboard players reset #request_villager
