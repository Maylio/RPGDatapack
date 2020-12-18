###このfunctionはadvancementのplayerattackentityから実行されています###
####プレイヤーがエンティティを攻撃したことを検知したときに実行###

#攻撃したプレイヤーに"attacker"タグをつける
tag @s add attacker
#無敵時間がついている"conbat_mob"に"defender"タグをつける
tag @e[tag=conbat_mob,nbt={HurtTime:10s}] add defender
#ダメージ計算を実行
function rpg:conbat/conbat_calculation