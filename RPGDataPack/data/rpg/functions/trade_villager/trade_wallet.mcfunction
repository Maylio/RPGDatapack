#交易メニューを閉じる
execute if entity @s[tag=!villager_trade_changed] run function rpg:trade_villager/close_offers

#名前をもとに戻す
data modify entity @s CustomName set from entity @s Inventory[0].tag.display.Name
#変更
data modify entity @s Offers set from entity @s Inventory[2].tag.Offers

#タグ変更
tag @s add villager_trade_changed