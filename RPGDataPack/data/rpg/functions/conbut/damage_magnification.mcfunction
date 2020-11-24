#もし"magnification_damage"タグがついていなかったら"conbut_damage_sv"に"conbut_damage"を保存
scoreboard players operation @s conbut_damage_sv = @s conbut_damage


#計算  
    #もし"magnification_damage"タグがついていなかったら計算する
    execute if entity @s[tag=!magnification_damage] run scoreboard players set #10 _ 10
    execute if entity @s[tag=!magnification_damage] run scoreboard players operation @s conbut_damage *= #10 _
    execute if entity @s[tag=!magnification_damage] run scoreboard players operation @s conbut_damage *= #magnification _
    execute if entity @s[tag=!magnification_damage] run scoreboard players set #100 _ 100
    execute if entity @s[tag=!magnification_damage] run scoreboard players operation @s conbut_damage /= #100 _
    #もし"magnification_damage"タグがついていたら"conbut_damage"に"conbut_damage_sv"を代入
    execute if entity @s[tag=magnification_damage] run scoreboard players operation @s conbut_damage = @s conbut_damage_sv

scoreboard players reset #10
scoreboard players reset #100
scoreboard players reset #magnification


#"magnification_damage"タグをつける
tag @s add magnification_damage