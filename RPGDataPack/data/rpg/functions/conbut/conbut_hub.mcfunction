
#"set_power"タグが付いたMOBが居たら実行
execute as @e[tag=set_status] run function rpg:conbut/set_status

#プレイヤーの攻撃力、防御力が存在しない場合0にセット
execute as @a unless score @s conbut_damage matches -2147483648..2147483647 run scoreboard players set @s conbut_damage 0
execute as @a unless score @s conbut_defense matches -2147483648..2147483647 run scoreboard players set @s conbut_defense 0

#プレイヤーとMOBに耐性
effect give @a resistance 100 100 true
effect give @e[tag=conbut_mob] resistance 100 100 true

#変更されたプレイヤーの最大HPをリセット(1tickずらさないとうまくダメージが入らないから)
execute as @e[tag=defender,type=player] run attribute @s minecraft:generic.max_health base set 20
tag @e[tag=defender] remove defender
tag @e[tag=attacker] remove attacker