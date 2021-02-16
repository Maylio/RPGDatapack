#交易メニューを閉じる
function rpg:trade_villager/close_offers

#交易を削除
data modify entity @s Offers set value {}

#タグ削除
tag @s remove villager_trade_changed