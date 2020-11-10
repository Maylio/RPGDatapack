###このfunctionはtalk_hubから実行されています###


#右クリックしているプレイヤーが見ている、名前が違うエンティティに"talk_reset_name"を付与
execute as @s at @s anchored eyes facing entity @e[tag=talk_name_different,limit=1,sort=nearest] eyes anchored feet positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.5] run tag @e[tag=talk_name_different,limit=1,sort=nearest] add talk_reset_name
#召喚された村人にもとからセットしておいた1番目のアイテムの名前を村人の名前に代入
execute as @e[tag=talk_reset_name,limit=1] run data modify entity @s CustomName set from entity @s Inventory[0].tag.display.Name
#"talk_name_different"タグをはく奪
tag @e[tag=talk_reset_name] remove talk_name_different
#"talk_reset_name"タグをはく奪
tag @e[tag=talk_reset_name] remove talk_reset_name
#右クリックのスコアをリセット
scoreboard players reset @s talk_right