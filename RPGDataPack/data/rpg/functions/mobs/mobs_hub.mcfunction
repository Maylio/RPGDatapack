#敵に耐性
effect give @e[tag=conbat_mob] resistance 100 100 true
#"set_status"タグが付いたMOBが居たら実行
execute as @e[tag=set_status] run function rpg:mobs/set_status

#ジャンプ攻撃の処理
execute as @e[tag=action_jumping] at @s run function rpg:mobs/actions/jumping_hub

#MOBの行動
    #スライム
    #summon slime ~ ~1 ~ {Tags:["conbat_mob","set_status","dream_slime","slime_inc"],PortalCooldown:30311,Size:1}
    execute if entity @e[tag=dream_slime] run function rpg:mobs/dream_slime/actions
    #"slime_inc"が付いていないスライムを奈落に落とす
    tp @e[type=slime,tag=!slime_inc] ~ ~-1000 ~ 

    #summon armor_stand ~ ~5 ~ {Small:1b,Invisible:1b,Tags:["squid"],Passengers:[{id:"minecraft:squid",Air:-200,PortalCooldown:30311,Tags:["conbat_mob","set_status","squid_body"]}]}
    #ただのイカ
    execute if entity @e[tag=squid] run function rpg:mobs/squid/actions
    #もしイカ墨の近くにプレイヤーが居た場合ダメージ処理
    execute as @e[tag=squid_bullet] at @s if entity @a[distance=..2,gamemode=!creative,gamemode=!spectator] run tag @s add attacker
    execute as @e[tag=squid_bullet] at @s as @a[distance=..2,gamemode=!creative,gamemode=!spectator] run tag @s add defender
    execute as @e[tag=squid_bullet] at @s as @a[distance=..2,gamemode=!creative,gamemode=!spectator] run function rpg:conbat/conbat_calculation
    execute as @e[tag=squid_bullet] at @s if entity @a[distance=..2,gamemode=!creative,gamemode=!spectator] run kill @s