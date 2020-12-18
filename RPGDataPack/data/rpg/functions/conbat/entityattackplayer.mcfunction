###このfunctionはadvancementのentityattackplayerから実行されています###
####エンティティがプレイヤーを攻撃したことを検知したときに実行###
#攻撃したプレイヤーに"attacker"タグをつける
tag @s add defender
#一番近くの"conbat_mob"に"attacker"をつける
tag @e[tag=conbat_mob,limit=1,sort=nearest] add attacker
#attackerが存在すればダメージ計算を実行
execute if entity @e[tag=attacker] run function rpg:conbat/conbat_calculation