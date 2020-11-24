
#プレイヤーの攻撃力、防御力が存在しない場合0にセット
execute as @a unless score @s conbut_damage matches -2147483648..2147483647 run scoreboard players set @s conbut_damage 0
execute as @a unless score @s conbut_defense matches -2147483648..2147483647 run scoreboard players set @s conbut_defense 0

#プレイヤーに耐性
effect give @a resistance 100 100 true

#変更されたプレイヤーの最大HPをリセット(1tickずらさないとうまくダメージが入らないから(スライムだけなぜか2tick待たないとダメージが入らなかったので2tick待たせる))
    #"conbut_wait_tick"が付いていない"defender"が付いたプレイヤーのHealthの最大値を20に戻す
    execute as @e[tag=defender,type=player,tag=!conbut_wait_tick] run attribute @s minecraft:generic.max_health base set 20
    #"conbut_wait_tick"が付いていない"defender"が付いたプレイヤーから"defense"をはく奪
    tag @e[tag=defender,type=player,tag=!conbut_wait_tick] remove defender
    #"conbut_wait_tick"が付いている"defender"が付いたプレイヤーから"conbut_wait_tick"をはく奪
    tag @e[tag=defender,type=player,tag=conbut_wait_tick] remove conbut_wait_tick


#プレイヤーの進捗をはく奪
advancement revoke @a only rpg:entityattackplayer
advancement revoke @a only rpg:playerattackentity