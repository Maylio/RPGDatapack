
#プレイヤーの攻撃力、防御力が存在しない場合0にセット
execute as @a unless score @s conbat_damage matches -2147483648..2147483647 run scoreboard players set @s conbat_damage 0
execute as @a unless score @s conbat_defense matches -2147483648..2147483647 run scoreboard players set @s conbat_defense 0

#プレイヤーに耐性
effect give @a resistance 100 100 true


#プレイヤーの進捗をはく奪
advancement revoke @a only rpg:entityattackplayer
advancement revoke @a only rpg:playerattackentity
tag @e[tag=defender_kill] remove defender_kill