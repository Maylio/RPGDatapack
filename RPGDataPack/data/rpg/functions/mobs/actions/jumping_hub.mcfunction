#飛び掛かり
    #ダメージ
        #"action_jumping"がついているときに半径0.5マス以内にプレイヤーが居ればダメージ
        execute as @s at @s if entity @a[distance=0..1.8,gamemode=!creative,gamemode=!spectator] run tag @s add attacker
        execute as @s at @s as @a[distance=0..1.8,gamemode=!creative,gamemode=!spectator] run tag @s add defender
        execute as @s at @s as @a[distance=0..1.8,gamemode=!creative,gamemode=!spectator] run function rpg:conbat/conbat_calculation
        #"action_jumping"がついているときに半径0.5マス以内にプレイヤーが地面に付いたことにする
        execute as @s at @s if entity @a[distance=0..1.8] run tag @s add OnGround
    #終了処理
        #地面についていたら"action_jump"タグを外して倍率をもとに戻す
        execute as @s at @s unless block ~ ~-0.001 ~ air run tag @s add OnGround
            #"action_jumping"タグを外す
            tag @s[tag=OnGround] remove action_jumping
            #"OnGround"タグを外す
            tag @s[tag=OnGround] remove OnGround