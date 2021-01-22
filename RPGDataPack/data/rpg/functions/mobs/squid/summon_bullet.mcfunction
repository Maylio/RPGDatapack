#イカ墨を召喚
summon minecraft:item ~ ~ ~ {Tags:["conbat_mob","set_status","squid_bullet","squid_bullet_unset"],PortalCooldown:50516,Age:5900,PickupDelay:200,Item:{id:"minecraft:polished_blackstone_button",Count:1b,tag:{squid_bullet:true}}}
#近くのプレイヤーの方を向く
execute as @e[tag=squid_bullet_unset] at @s facing entity @p eyes run tp @s ~ ~ ~ ~ 0
#見ている方向に飛ぶ
execute as @e[tag=squid_bullet_unset] at @s rotated as @s run function rpg:mobs/squid/bullet_move