#もし4マス以上落ちたモブが居た場合ファンクション実行
execute as @e[tag=conbat_mob,nbt={OnGround:1b}] if score @s damage_fall matches 4.. run function rpg:damage/fall
#スコアリセット
scoreboard players reset @e[tag=conbat_mob] damage_fall
#もし落ちた距離が0以外のモブがいた場合落ちた距離をスコアに代入する
execute as @e[tag=conbat_mob,nbt=!{FallDistance:0.0f},nbt=!{OnGround:1b}] store result score @s damage_fall run data get entity @s FallDistance


#もし4マス以上落ちたプレイヤーが居た場合ファンクション実行
execute as @a[nbt={OnGround:1b},gamemode=!creative,gamemode=!spectator] if score @s damage_fall matches 4.. run function rpg:damage/fall
#スコアリセット
scoreboard players reset @a damage_fall
#もし落ちた距離が0以外のプレイヤーがいた場合落ちた距離をスコアに代入する
execute as @a[nbt=!{FallDistance:0.0f},nbt=!{OnGround:1b},gamemode=!creative,gamemode=!spectator] store result score @s damage_fall run data get entity @s FallDistance

