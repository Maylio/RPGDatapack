#落下ダメージの計算式
#ダメージ = 落ちた距離 - 3

#実行者の持つスコアが変化しないように計算用スコアにコピー
scoreboard players operation #fall_distance damage_fall = @s damage_fall

#落ちた距離から3マス引く
scoreboard players set #3 damage_fall 3
scoreboard players operation #fall_distance damage_fall -= #3 damage_fall

#ScoreToHealthに代入するために100倍にする
scoreboard players set #100 damage_fall 100
scoreboard players operation #fall_distance damage_fall *= #100 damage_fall

#プレイヤーのHPからダメージを引いて残り体力を出す
execute store result score #Health damage_fall run data get entity @s Health 100
scoreboard players operation #Health damage_fall -= #fall_distance damage_fall

#もし実行者がプレイヤーかつ残った体力が0以下ならkill
execute if entity @s[type=player] if score #Health damage_fall matches ..0 run kill @s
#もし実行者がプレイヤーかつ1以上の場合計算で出たHPをScoreToHealthに代入
execute if entity @s[type=player] if score #Health damage_fall matches 1.. run scoreboard players operation @s ScoreToHealth = #Health damage_fall

#もし実行者がプレイヤー以外の場合Healthに計算で出たスコアを直接代入する
execute if entity @s[type=!player] store result entity @s Health float 0.01 run scoreboard players get #Health damage_fall

#スコアリセット
scoreboard players reset #3
scoreboard players reset #100
scoreboard players reset #fall_distance
scoreboard players reset #Health