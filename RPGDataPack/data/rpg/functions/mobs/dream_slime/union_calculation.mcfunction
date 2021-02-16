#ステータス取得
    #攻撃力
    execute as @s store result score #damage1 _ run scoreboard players get @s conbat_damage
    execute as @e[tag=union_target_slime] store result score #damage2 _ run scoreboard players get @s conbat_damage
    #防御力
    execute as @s store result score #defense1 _ run scoreboard players get @s conbat_defense
    execute as @e[tag=union_target_slime] store result score #defense2 _ run scoreboard players get @s conbat_defense
    #体力
    execute as @s store result score #health1 _ run data get entity @s Health
    execute as @e[tag=union_target_slime] store result score #health2 _ run data get entity @s Health
    #サイズ
    execute as @s store result score #size1 _ run data get entity @s Size
    execute as @e[tag=union_target_slime] store result score #size2 _ run data get entity @s Size
#もし両方がサイズ0の場合片方を-1にする
execute if score #size1 _ matches ..0 if score #size2 _ matches ..0 run scoreboard players set #size1 _ -1
#もしサイズが0以下の場合1に設定する
execute if score #size1 _ matches ..0 run scoreboard players add #size1 _ 1
execute if score #size2 _ matches ..0 run scoreboard players add #size2 _ 1


#計算
scoreboard players operation #damage1 _ += #damage2 _
scoreboard players operation #defense1 _ += #defense2 _
scoreboard players operation #health1 _ += #health2 _
scoreboard players operation #size1 _ += #size2 _
    #代入
    scoreboard players set #10000 _ 10000
    scoreboard players set #100 _ 100
    scoreboard players operation #damage1 _ *= #10000 _
    scoreboard players operation #defense1 _ *= #100 _
    scoreboard players operation #damage1 _ += #defense1 _
    scoreboard players operation #damage1 _ += #health1 _


#合体後
    #召喚
    summon minecraft:slime ~ ~ ~ {Tags:["conbat_mob","dream_slime","slime_inc","unioned_slime","union_slime"],PortalCooldown:1,Size:0}
    #代入
    execute as @e[tag=unioned_slime] store result entity @s Size int 1 run scoreboard players get #size1 _
    execute as @e[tag=unioned_slime] store result entity @s PortalCooldown int 1 run scoreboard players get #damage1 _
    execute as @e[tag=unioned_slime] run function rpg:mobs/set_status
    #タグはく奪
tag @e[tag=unioned_slime] remove unioned_slime


#合体前削除
tp @s ~ ~-1000 ~
tp @e[tag=union_target_slime] ~ ~-1000 ~

scoreboard players reset #10000
scoreboard players reset #100
scoreboard players reset #damage1
scoreboard players reset #damage2
scoreboard players reset #defense1
scoreboard players reset #defense2
scoreboard players reset #health1
scoreboard players reset #health2
scoreboard players reset #size1
scoreboard players reset #size2