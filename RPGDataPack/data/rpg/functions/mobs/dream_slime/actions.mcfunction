###このfunctionはmobs_hubから実行されています###

#"slime_inc"が付いていないスライムを奈落に落とす
tp @e[type=slime,tag=!slime_inc] ~ ~-1000 ~ 


#タイムライン
    #125~150
        #もし近くにプレイヤーがいる場合スライムを動かなくする
        execute as @e[tag=dream_slime,scores={AI_tick=125..150},nbt={wasOnGround:true}] at @s if entity @a[distance=..10] run data modify entity @s NoAI set value true
        #プレイヤーの方を向かせる
        execute as @e[tag=dream_slime,scores={AI_tick=125..150},nbt={NoAI:true}] at @s facing entity @p eyes run tp @s ~ ~ ~ ~ 0
    #150
        #飛び掛かり攻撃
        execute as @e[tag=dream_slime,scores={AI_tick=150},nbt={NoAI:true}] run data modify entity @s NoAI set value false
        execute as @e[tag=dream_slime,scores={AI_tick=150}] run function rpg:mobs/actions/jumping

    execute as @e[tag=dream_slime,nbt={NoAI:true}] at @s unless entity @a[distance=..10] run data modify entity @s NoAI set value false



#合体
    #もしHPが5以下の場合合体用のタグを付与
    execute as @e[tag=dream_slime,tag=!dream_slime_union,tag=!union_slime] store result score @s get_health run data get entity @s Health
    execute as @e[tag=dream_slime,tag=!dream_slime_union,tag=!union_slime,scores={get_health=..5}] run tag @s add dream_slime_union
    scoreboard players reset @e[tag=dream_slime] get_health
    #もし"dream_slime_union"タグがついたスライムの周りにスライムがいればスライムを動かす
    execute as @e[tag=dream_slime,tag=dream_slime_union,tag=!union_slime] at @s if entity @e[tag=dream_slime,tag=!dream_slime_union,tag=!union_slime,distance=..8] run function rpg:mobs/dream_slime/union_move
    #もし"dream_slime_union"タグがついたスライムの半径2マス以内に"dream_slime_union"タグがついていないスライムが居れば合体
    execute as @e[tag=dream_slime,tag=dream_slime_union,tag=!union_slime] at @s as @e[tag=dream_slime,tag=!dream_slime_union,tag=!union_slime,distance=..0.8] run tag @s add union_target_slime
    execute as @e[tag=dream_slime_union] at @s if entity @e[tag=union_target_slime] run function rpg:mobs/dream_slime/union_calculation

#スコア管理
    #"dream_slime_union"タグがついたスライムの周りにスライムが居ればスコアをリセットする
    execute as @e[tag=dream_slime_union] at @s if entity @e[tag=dream_slime,tag=!dream_slime_union,distance=..8] run scoreboard players reset @s AI_tick
    #加算
    scoreboard players add @e[tag=dream_slime] AI_tick 1
    #161の時にリセット(10余っているのは飛んだ瞬間にリセットさせないため)
    scoreboard players reset @e[tag=dream_slime,scores={AI_tick=161..}] AI_tick