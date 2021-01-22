#ダメージをもとに戻す
scoreboard players operation @s conbat_damage -= #damage_save _

#タグ削除
tag @s remove critical
scoreboard players reset #damage_save