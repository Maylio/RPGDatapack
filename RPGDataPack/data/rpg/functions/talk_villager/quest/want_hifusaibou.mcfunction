###このfunctionはtalkから実行されています###

##################################
#交易できる皮膚細胞のgiveコマンド
#give @s white_dye{talk_quest:"want_hifusaibou",display:{Name:'{"text":"田中さんの皮膚細胞","color":"yellow"}'}} 1
##################################

#プレイヤーが見ている"talker"タグが付いている村人の名前を変える
data modify entity @e[limit=1,tag=talker,tag=!talk_finish,tag=quest_want_hifusaibou,sort=nearest] CustomName set value '{"text":"え？いらないって？一回だけだよ？"}'
#クエストを達成したら交易アイテム名を変える
data modify entity @e[limit=1,tag=talker,tag=!talk_finish,tag=quest_want_hifusaibou,sort=nearest] Offers.Recipes[{buy:{tag:{display:{Name:'{"text":"クエスト名：不要な「何か」","color":"yellow"}'}}}}].buy.tag.display.Name set value '{"text":"達成済み：不要な「何か」","color":"red"}'
#プレイヤーからアイテムを1つ消す
clear @s white_dye{talk_quest:"want_hifusaibou"} 1
#"quest_want_hifusaibou"タグをはく奪して交易できないようにする
tag @e[limit=1,tag=talker,tag=quest_want_hifusaibou,tag=!talk_finish,sort=nearest] remove quest_want_hifusaibou