#ダメージ = ダメージ*(1 –  min( 20, max( 防御/5 , 防御 – ダメージ / (2+特殊防御/4)  ))/25  )

scoreboard players operation #damage _ = @e[tag=attacker] conbut_damage
scoreboard players operation #defense _ = @e[tag=defender] conbut_defense

#スコア
    #端数を消させないためにスコアを100倍にする
    scoreboard players set #100 _ 100
    scoreboard players operation #sp_defense _ *= #100 _
    scoreboard players operation #defense _ *= #100 _
    scoreboard players operation #damage _ *= #100 _
    #計算用に代入したり
    scoreboard players operation #damage_calc _ = #damage _
    scoreboard players operation #defense_calc _ = #defense _

#軽減割合計算
    #一
        #特殊防御を４00で割る
        scoreboard players set #400 _ 400
        scoreboard players operation #sp_defense _ /= #400 _
        #上の結果に２を足す
        scoreboard players set #2 _ 2
        scoreboard players operation #sp_defense _ += #2 _
        #上の結果でダメージを割る
        scoreboard players operation #damage_calc _ /= #sp_defense _
        #防御から上の結果を引く
        scoreboard players operation #defense _ -= #damage_calc _
    #二
        #防御を５で割る
        scoreboard players set #5 _ 5
        scoreboard players operation #defense_calc _ /= #5 _


#一と二を比較して大きいほうを代入
    #比較
        #一と二を比較して大きい方を"defense_max"に代入
        execute if score #defense _ < #defense_calc _ run scoreboard players operation #defense_max _ = #defense_calc _
        execute if score #defense _ > #defense_calc _ run scoreboard players operation #defense_max _ = #defense _

#"defense_max"と20を計算して小さいほうを"perce"に代入して25で割り100から引く
    #比較
        #"defense_max"と2000を比較して小さいほうを"perce"に代入
        scoreboard players set #2000 _ 2000
        execute if score #defense_max _ < #2000 _ run scoreboard players operation #perce _ = #defense_max _
        execute if score #defense_max _ > #2000 _ run scoreboard players operation #perce _ = #2000 _
    #計算
        #25で"defense_max"を割る
        scoreboard players set #25 _ 25
        scoreboard players operation #perce _ /= #25 _
        #100から"perce"を引く
        scoreboard players operation #100 _ -= #perce _



#ダメージを(100-"perce")で掛ける
scoreboard players operation #damage _ *= #100 _

#相手がPlayer以外の場合
    #計算し終わった"damage"を"Health"から引く
    execute if entity @e[tag=defender,type=!player] store result score #Health _ run data get entity @e[tag=defender,type=!player,limit=1] Health 10000
    execute if entity @e[tag=defender,type=!player] run scoreboard players operation #Health _ -= #damage _
    #計算し終わった"Health"を戻す
    execute if entity @e[tag=defender,type=!player] store result entity @e[tag=defender,type=!player,limit=1] Health float 0.0001 run scoreboard players get #Health _
    #演出用に10000で整数に戻す
    execute if entity @e[tag=defender,type=!player] run scoreboard players set #10000 _ 10000
    execute if entity @e[tag=defender,type=!player] run scoreboard players operation #Health _ /= #10000 _

#相手がPlayerの場合
    #プレイヤーのHPを"Health"に代入
    execute if entity @e[tag=defender,type=player] store result score #Health _ run data get entity @e[tag=defender,type=player,limit=1] Health 10000
    #"Health"から"damage"を引き算
    execute if entity @e[tag=defender,type=player] run scoreboard players operation #Health _ -= #damage _
    #10000で割る
    execute if entity @e[tag=defender,type=player] run scoreboard players set #10000 _ 10000
    execute if entity @e[tag=defender,type=player] run scoreboard players operation #Health _ /= #10000 _
    #"Health"のスコアによって最大HPを変更
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 1 run attribute @s minecraft:generic.max_health base set 1
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 2 run attribute @s minecraft:generic.max_health base set 2
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 3 run attribute @s minecraft:generic.max_health base set 3
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 4 run attribute @s minecraft:generic.max_health base set 4
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 5 run attribute @s minecraft:generic.max_health base set 5
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 6 run attribute @s minecraft:generic.max_health base set 6
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 7 run attribute @s minecraft:generic.max_health base set 7
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 8 run attribute @s minecraft:generic.max_health base set 8
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 9 run attribute @s minecraft:generic.max_health base set 9
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 10 run attribute @s minecraft:generic.max_health base set 10
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 11 run attribute @s minecraft:generic.max_health base set 11
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 12 run attribute @s minecraft:generic.max_health base set 12
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 13 run attribute @s minecraft:generic.max_health base set 13
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 14 run attribute @s minecraft:generic.max_health base set 14
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 15 run attribute @s minecraft:generic.max_health base set 15
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 16 run attribute @s minecraft:generic.max_health base set 16
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 17 run attribute @s minecraft:generic.max_health base set 17
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 18 run attribute @s minecraft:generic.max_health base set 18
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 19 run attribute @s minecraft:generic.max_health base set 19
    #0以下の場合kill
    execute if entity @e[tag=defender,type=player] if score #Health _ matches ..0 run kill @s
    #最大HPが変更された状態で即時回復を掛けると最大Hpをもとに戻してもHPが減ったままになる
    execute if entity @e[tag=defender,type=player] run effect give @s instant_health 1 200 true

scoreboard players set #10000 _ 10000
scoreboard players operation #damage _ /= #10000 _
tellraw @a [{"text":"軽減割合:"},{"score":{"name":"#perce","objective":"_"}},{"text":"％"}]
tellraw @a [{"text":"ダメージ:"},{"score":{"name":"#damage","objective":"_"}}]    

#スコアリセット
scoreboard players reset #2
scoreboard players reset #5
scoreboard players reset #2000
scoreboard players reset #25
scoreboard players reset #100
scoreboard players reset #400
scoreboard players reset #sp_defense
scoreboard players reset #damage
scoreboard players reset #damage_calc
scoreboard players reset #defense
scoreboard players reset #defense_calc
scoreboard players reset #defense_max
scoreboard players reset #perce
scoreboard players reset #Health