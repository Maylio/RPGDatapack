#もしクールタイムが1以上の場合スコアを1ずつ引く
scoreboard players remove @a[scores={guard_cooltime=1..}] guard_cooltime 1

#もしクールタイムが0以下になった場合効果音を鳴らす
execute as @a[scores={guard_cooltime=..0}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 2 2
#もしクールタイムが0以下になった場合クールタイムをリセットする
scoreboard players reset @a[scores={guard_cooltime=..0}] guard_cooltime

#もしガードしていなくて、武器を持って、シフトしていて、クールタイムが設定されていないプレイヤーがいた場合ガード
execute as @a[scores={guard_shift=1},tag=!guard_player,nbt={SelectedItem:{tag:{weapon:true}}}] unless score @s guard_cooltime matches -2147483648..2147483647 run function rpg:guard/guard_add
#もしタグの付いたプレイヤーが10tick以上シフトしたらガード削除
execute as @a[tag=guard_player] unless score @s guard_shift matches 1..10 run function rpg:guard/guard_remove

#もしシフトしてない場合スコアリセット
execute as @a unless entity @s[scores={guard_shift_t=-2147483648..2147483647}] run scoreboard players reset @a guard_shift
scoreboard players reset @a guard_shift_t