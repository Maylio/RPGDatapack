###このfunctionはadvancementのplayerattackentityから実行されています###
####プレイヤーがエンティティを攻撃したことを検知したときに実行###

#攻撃したプレイヤーに"attacker"タグをつける
tag @s add attacker

#もしプレイヤーが落下中の場合攻撃力を５０％増加
execute if entity @s[nbt=!{FallDistance:0.0f}] run function rpg:conbat/critical_calc

#無敵時間がついている"conbat_mob"に"defender"タグをつける
tag @e[tag=conbat_mob,nbt={HurtTime:10s}] add defender
#ダメージ計算を実行
function rpg:conbat/conbat_calculation

#クリティカルで増加した攻撃力をもとに戻す
execute as @a[tag=critical] run function rpg:conbat/critical_reset