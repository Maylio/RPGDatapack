#決済
scoreboard players operation @s trade_money -= #price trade_calc

#プレイヤーに商品を渡す
summon item ~ ~ ~ {Tags:["product"],Item:{id:"minecraft:stone",Count:1b},PickupDelay:0s}
data modify entity @e[tag=product,limit=1,sort=nearest] Item set from entity @s Inventory[{tag:{product:true}}].tag.give

#プレイヤーから偽の商品を削除
clear @s #rpg:allitems{product:true}

#財布を与える
give @s minecart{display:{Name:'{"text":"お財布","color":"yellow"}'},wallet:true} 1
