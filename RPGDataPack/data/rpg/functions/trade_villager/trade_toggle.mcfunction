#現在の交易と1番インベントリを記録
data modify storage villager:trade Offers set from entity @s Offers
data modify storage villager:inventory Inventory set from entity @s Inventory[0]
#交易をリセットして１番インベントリから代入
data modify entity @s Offers set value {}
data modify entity @s Offers set from entity @e[tag=talk_can,limit=1] Inventory[0].tag.Offers
#１番インベントリをリセット
replaceitem entity @s villager.0 air
#ストレージの中のアイテムのtagに交易情報を代入
data modify storage villager:inventory Inventory.tag.Offers set from storage villager:trade Offers
#１番インベントリにストレージで編集したアイテムを代入
data modify entity @s Inventory[] set from storage villager:inventory Inventory
#ストレージを削除
data remove storage villager:trade Offers
data remove storage villager:inventory Inventory

execute if entity @s[tag=!trader] as @a[distance=..5,nbt={SelectedItem:{tag:{trade:"wallet"}}}] store result score @s trade_money run data get entity @s SelectedItem.tag.trade_money

execute if entity @s[tag=trader] as @a[nbt=!{SelectedItem:{tag:{trade:"wallet"}}}] run scoreboard players reset @s trade_money