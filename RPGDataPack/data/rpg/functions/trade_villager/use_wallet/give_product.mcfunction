#決済
scoreboard players operation @s trade_money -= #price trade_calc

#取引成功
title @s actionbar {"entity":"@s","nbt":"Inventory[{tag:{product:true}}].tag.success_word"}

#プレイヤーに商品を渡す
summon item ~ ~ ~ {Tags:["product"],Item:{id:"minecraft:stone",Count:1b},PickupDelay:1s}
data modify entity @e[tag=product,limit=1,sort=nearest] Item set from entity @s Inventory[{tag:{product:true}}].tag.give

#プレイヤーから偽の商品を削除
clear @s #rpg:allitems{product:true}

#財布を与える
summon item ~ ~ ~ {PickupDelay:1s,Item:{id:"minecart",Count:1b,tag:{display:{Name:'{"text":"お財布","color":"yellow"}'},wallet:true}}}