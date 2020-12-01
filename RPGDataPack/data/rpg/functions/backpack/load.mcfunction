#"summoner"タグが付いているプレイヤーとロバのスコアを比較して、同じならバックパックの中身をロバに代入
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=summoner,limit=1] setid_number run data modify entity @s Items set from entity @a[tag=summoner,limit=1] SelectedItem.tag.backpackItems
#タグはく奪
tag @a[tag=summoner] remove summoner
