#もし近くに武器を持っているプレイヤーが居たら交易内容をクエスト関連に切り替える
execute as @e[tag=villager_quest_giver] at @s if entity @a[distance=..3,nbt={SelectedItem:{tag:{weapon:true}}}] run function rpg:trade_villager/trade_quest
#もし近くにお財布を持っているプレイヤーが居たら交易内容を交易関連に切り替える
execute as @e[tag=villager_trader] at @s if entity @a[distance=..3,nbt={SelectedItem:{tag:{wallet:true}}}] run function rpg:trade_villager/trade_wallet


#もし近くにお財布か武器を持ったプレイヤーが居なければ交易を削除
execute as @e[tag=villager_quest_giver,tag=villager_trade_changed] at @s unless entity @a[distance=..3] run function rpg:trade_villager/trade_reset
execute as @e[tag=villager_trader,tag=villager_trade_changed] at @s unless entity @a[distance=..3] run function rpg:trade_villager/trade_reset


#もし偽の商品に分類されるアイテムを持っていた場合
execute as @a[nbt={Inventory:[{tag:{product:true}}]}] at @s run function rpg:trade_villager/use_wallet/wallet_hub
execute as @e[type=item,nbt={Item:{tag:{product:true}}},nbt=!{PickupDelay:0s}] run data modify entity @s PickupDelay set value 0s

#もしshiftした場合現在の残高を表示
execute as @a[nbt={SelectedItem:{tag:{wallet:true}}},scores={trade_shift=1..}] run title @s actionbar [{"text": "残高：","color": "yellow"},{"score":{"name":"@s","objective":"trade_money"},"color":"aqua"}]
scoreboard players reset @a[scores={trade_shift=1..}] trade_shift


#村人のインベントリがバグで増殖して必要以上にある場合削除
execute as @e[tag=villager_quest_giver] if data entity @s Inventory[6] run replaceitem entity @s villager.6 air
execute as @e[tag=villager_quest_giver] if data entity @s Inventory[7] run replaceitem entity @s villager.7 air