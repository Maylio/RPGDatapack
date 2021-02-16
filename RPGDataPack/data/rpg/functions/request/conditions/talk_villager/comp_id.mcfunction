#依頼書の条件のVillager_IDをスコア化
execute store result score #request_id request_calc run data get entity @s SelectedItem.tag.request_step[0].conditions.Villager_ID
#村人のIDをスコア化
execute store result score #target_id request_calc run data get entity @e[tag=target,limit=1] Inventory[0].tag.Villager_ID

#比較して一致していた場合報酬を与える
execute if score #request_id request_calc = #target_id request_calc at @s run function rpg:request/reward/rewards

#スコア管理
scoreboard players reset #target_id
scoreboard players reset #request_id