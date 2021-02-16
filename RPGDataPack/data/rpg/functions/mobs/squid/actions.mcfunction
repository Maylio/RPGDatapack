#data
execute as @e[tag=squid] at @s run data modify entity @s Motion[1] set value -0.05d
execute as @e[tag=squid_body] at @s run data modify entity @s Air set value -200

#もしいかが上に乗っていなかったらkill
execute as @e[tag=squid] unless data entity @s Passengers run kill @s
#一番近くのイカの目線を自分と同じほうに向ける
execute as @e[tag=squid] at @s as @e[tag=squid_body,limit=1,sort=nearest] at @s run tp @s ~ ~ ~ ~ ~

#行動パターン
    
    #48
        #もし近くにプレイヤーが居なかったら48度横を向く
        execute as @e[tag=squid,scores={AI_tick=48}] at @s unless entity @a[distance=..20] run tp @s ~ ~ ~ ~48 0
        #もし近くにプレイヤーが居た場合プレイヤーの方を向く
        execute as @e[tag=squid,scores={AI_tick=48}] at @s if entity @a[distance=..20] facing entity @p eyes run tp @s ~ ~ ~ ~ 0
        
    #49
        #見ている方向に飛ぶ
        execute as @e[tag=squid,scores={AI_tick=49}] at @s rotated as @s run function rpg:mobs/squid/squid_move
        #イカ墨を飛ばす
        execute as @e[tag=squid,scores={AI_tick=49}] at @s if entity @a[distance=..20] run function rpg:mobs/squid/summon_bullet

#スコア管理
    #加算
    scoreboard players add @e[tag=squid] AI_tick 1
    #10の時にリセット
    scoreboard players reset @e[tag=squid,scores={AI_tick=50..}] AI_tick
