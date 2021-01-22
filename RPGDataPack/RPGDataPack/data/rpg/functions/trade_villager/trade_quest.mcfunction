#変更
data modify entity @s Offers set from entity @s Inventory[1].tag.Offers

#タグ変更
tag @s add villager_trade_changed