#交易メニューを閉じる
execute if entity @s[tag=villager_trade_changed] run function rpg:trade_villager/close_offers

#変更
data modify entity @s Offers set value {}

#タグはく奪
tag @a[distance=..3,tag=have_wallet] remove have_wallet
#タグ変更
tag @s remove villager_trade_changed