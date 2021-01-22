#ランダム抽選
loot spawn ~ 100 ~ loot rpg:talk_villager/villager_random
#出た番号に応じてインベントリから名前を引き出す
execute if entity @e[type=item,nbt={Item:{tag:{random:true,random_num:1}}}] run data modify entity @s CustomName set from entity @s Inventory[3].tag.display.Name
execute if entity @e[type=item,nbt={Item:{tag:{random:true,random_num:2}}}] run data modify entity @s CustomName set from entity @s Inventory[4].tag.display.Name
execute if entity @e[type=item,nbt={Item:{tag:{random:true,random_num:3}}}] run data modify entity @s CustomName set from entity @s Inventory[5].tag.display.Name


#タグ付与
tag @s add villager_name_changed
#kill
kill @e[type=item,nbt={Item:{tag:{random:true}}}]