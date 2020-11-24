###このfunctionはadvancementのentityattackplayerから実行されています###
####エンティティがプレイヤーを攻撃したことを検知したときに実行###
#攻撃したプレイヤーに"attacker"タグをつける
tag @s add defender
#一番近くの"conbut_mob"に"attacker"をつける
tag @e[tag=conbut_mob,limit=1,sort=nearest] add attacker
#attackerが付いているプレイヤーがいたらattackerタグを追加
execute as @a[advancements={rpg:playerattackentity=true}] run tag @s add attacker
#ダメージ計算を実行
function rpg:conbut/conbut_calculation