###このfunctionはadvancementのplayerattackentityから実行されています###
####プレイヤーがエンティティを攻撃したことを検知したときに実行###

#攻撃したプレイヤーに"attacker"タグをつける
tag @s add attacker
#無敵時間がついている"conbut_mob"に"defender"タグをつける
tag @e[tag=conbut_mob,nbt={HurtTime:10s}] add defender
#ダメージ計算を実行
function rpg:conbut/conbut_calculation
#プレイヤーから進捗をはく奪
advancement revoke @s only rpg:playerattackentity