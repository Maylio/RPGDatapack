execute as @e[tag=talk_can,tag=!trader] at @s if entity @a[distance=..5,nbt={SelectedItem:{tag:{trade:"wallet"}}}] run function rpg:trade_villager/trade_toggle
execute as @e[tag=talk_can,tag=!trader] at @s if entity @a[distance=..5,nbt={SelectedItem:{tag:{trade:"wallet"}}}] run tag @s add trader

execute as @a[nbt=!{SelectedItem:{tag:{trade:"wallet"}}}] at @s unless entity @e[tag=talk_can,tag=trader,distance=..5] as @e[tag=talk_can,tag=trader,distance=..5.5] run function rpg:trade_villager/trade_toggle
execute as @a[nbt=!{SelectedItem:{tag:{trade:"wallet"}}}] at @s unless entity @e[tag=talk_can,tag=trader,distance=..5] as @e[tag=talk_can,tag=trader,distance=..5.5] run tag @s remove trader

execute as @a[scores={trade_do=1..}] at @s if data entity @s Inventory[{tag:{trade:"product"}}] run function rpg:trade_villager/trade_calculation

#村人のインベントリが必要以上にある場合削除
execute as @e[tag=talk_can] if data entity @s Inventory[1] run replaceitem entity @s villager.1 air
execute as @e[tag=talk_can] if data entity @s Inventory[2] run replaceitem entity @s villager.2 air
execute as @e[tag=talk_can] if data entity @s Inventory[3] run replaceitem entity @s villager.3 air
execute as @e[tag=talk_can] if data entity @s Inventory[4] run replaceitem entity @s villager.4 air
execute as @e[tag=talk_can] if data entity @s Inventory[5] run replaceitem entity @s villager.5 air
execute as @e[tag=talk_can] if data entity @s Inventory[6] run replaceitem entity @s villager.6 air
execute as @e[tag=talk_can] if data entity @s Inventory[7] run replaceitem entity @s villager.7 air