#あとで指定するためにタグ付与
tag @s add critical

#攻撃力+(攻撃力/2)
scoreboard players set #2 _ 2
scoreboard players operation #damage_save _ = @s conbat_damage
scoreboard players operation #damage_save _ /= #2 _
scoreboard players operation @s conbat_damage += #damage_save _

#スコアリセット
scoreboard players reset #2