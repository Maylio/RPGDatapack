#NBTを編集できるように財布を召喚
summon item ~ ~ ~ {PickupDelay:0,Tags:["trade_wallet"],Item:{id:"minecraft:minecart",Count:1b,tag:{display:{Name:'{"text":"お財布","color":"yellow"}'},trade:"wallet",trade_money:0}}}
execute store result entity @e[tag=trade_wallet,limit=1] Item.tag.trade_money int 1 run scoreboard players get @s trade_money
#"#trade_price"の仮想プレイヤーにプレイヤーが持っている商品の値段を代入
execute store result score #trade_price trade_money run data get entity @s Inventory[{tag:{trade:"product"}}].tag.trade_price
#"プレイヤーの財布の中身"-"商品の値段"
scoreboard players operation @s trade_money -= #trade_price trade_money
tellraw @a ["",{"score":{"name":"@s","objective":"trade_money"}},{"text":" "},{"score":{"name":"#trade_price","objective":"trade_money"}},{"text":" "}]
execute as @s if score @s trade_money matches 0.. run function rpg:trade_villager/trade_giveproduct
scoreboard players operation @s trade_money += #trade_price trade_money

execute store result entity @e[tag=trade_wallet,limit=1] Item.tag.trade_money int 1 run scoreboard players get @s trade_money
clear @s #rpg:allitems{trade:"product"}
tellraw @a ["",{"score":{"name":"@s","objective":"trade_money"}},{"text":" "},{"score":{"name":"#trade_price","objective":"trade_money"}},{"text":" "}]
tag @e[tag=trade_wallet] remove trade_wallet
scoreboard players reset #trade_price
scoreboard players reset @s trade_money
scoreboard players reset @s trade_do