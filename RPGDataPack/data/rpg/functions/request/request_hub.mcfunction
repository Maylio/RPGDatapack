#もし依頼書のconditionsがtalk_villagerなら実行
execute if data entity @s SelectedItem{tag:{request_step:[{conditions:{talk_villager:true}}]}} run function rpg:request/conditions/talk_villager/comp_id

#もし依頼書のconditionsがtest_itemなら実行
execute if data entity @s SelectedItem{tag:{request_step:[{conditions:{test_item:true}}]}} run function rpg:request/conditions/test_item/comp_id