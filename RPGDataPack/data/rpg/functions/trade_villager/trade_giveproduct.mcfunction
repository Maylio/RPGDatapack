summon item ~ ~ ~ {Item:{id:"minecraft:stone",Count:1b},PickupDelay:0,Tags:["trade_product"]}
data modify entity @e[tag=trade_product,limit=1] Item set from entity @s Inventory[{tag:{trade:"product"}}]
data remove entity @e[tag=trade_product,limit=1] Item.tag.trade
data remove entity @e[tag=trade_product,limit=1] Item.tag.trade_price
tag @e[tag=trade_product] remove trade_product
execute store result entity @e[tag=trade_wallet,limit=1] Item.tag.trade_money int 1 run scoreboard players get @s trade_money
scoreboard players operation @s trade_money -= #trade_price trade_money