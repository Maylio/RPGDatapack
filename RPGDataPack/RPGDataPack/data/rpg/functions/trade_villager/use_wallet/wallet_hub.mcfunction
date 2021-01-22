scoreboard players add @s trade_money 0

#商品の数×商品の値段
execute store result score #count trade_calc run data get entity @s Inventory[{tag:{product:true}}].Count
execute store result score #price trade_calc run data get entity @s Inventory[{tag:{product:true}}].tag.trade_price

scoreboard players operation #price trade_calc *= #count trade_calc

#プレイヤーのお金を変動しないように計算用スコアに代入
scoreboard players operation #money trade_calc = @s trade_money

#自分の持ち金から商品の値段を引く
scoreboard players operation #money trade_calc -= #price trade_calc
execute if score #money trade_calc matches 0.. run function rpg:trade_villager/use_wallet/give_product
execute if score #money trade_calc matches ..-1 run function rpg:trade_villager/use_wallet/delete_product

#スコア削除
scoreboard players reset #count
scoreboard players reset #price
scoreboard players reset #money

