#guard_playerのタグがついているならタグを削除
execute if entity @s[tag=guard_player] run effect give @e[tag=attacker] slowness 2 10
execute if entity @s[tag=guard_player] run effect give @e[tag=attacker] weakness 2 200
execute if entity @s[tag=guard_player] run tag @e[tag=attacker] remove attacker
execute if entity @s[tag=guard_player] run tag @e[tag=defender] remove defender
execute if entity @s[tag=guard_player] run playsound minecraft:block.anvil.place master @s ~ ~ ~ 1 2

#ダメージ = ダメージ*(1 –  min( 20, max( 防御/5 , 防御 – ダメージ / (2+特殊防御/4)  ))/25  )

scoreboard players operation #damage _ = @e[tag=attacker] conbat_damage
scoreboard players operation #defense _ = @e[tag=defender] conbat_defense

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
    #100で割る
    execute if entity @e[tag=defender,type=player] run scoreboard players set #100 _ 100
    execute if entity @e[tag=defender,type=player] run scoreboard players operation #Health _ /= #100 _
    #ダメージを受けた演出
    effect give @e[tag=defender,type=player] instant_damage 1 32 true
    #0以上だった場合ScoreToHealthにHPを調整してもらう
    execute if entity @e[tag=defender,type=player] if score #Health _ matches 0.. run scoreboard players operation @e[tag=defender,type=player] ScoreToHealth = #Health _
    ##Healthが0以下ならkill
    execute if entity @e[tag=defender,type=player] if score #Health _ matches ..0 run tag @e[tag=defender,type=player] add defender_kill
    execute if entity @e[tag=defender,type=player] if score #Health _ matches ..0 run tag @e[tag=defender_kill] remove defender
    kill @e[tag=defender_kill,type=player]

#タグはく奪
tag @e[tag=defender] remove defender
tag @e[tag=attacker] remove attacker

scoreboard players set #10000 _ 10000
scoreboard players operation #damage _ /= #10000 _
#tellraw @a [{"text":"軽減割合:"},{"score":{"name":"#perce","objective":"_"}},{"text":"％"}]
#tellraw @a [{"text":"ダメージ:"},{"score":{"name":"#damage","objective":"_"}}]

#スコアリセット
scoreboard players reset #2
scoreboard players reset #5
scoreboard players reset #2000
scoreboard players reset #25
scoreboard players reset #100
scoreboard players reset #400
scoreboard players reset #10000
scoreboard players reset #sp_defense
scoreboard players reset #damage
scoreboard players reset #damage_calc
scoreboard players reset #defense
scoreboard players reset #defense_calc
scoreboard players reset #defense_max
scoreboard players reset #perce
scoreboard players reset #Health