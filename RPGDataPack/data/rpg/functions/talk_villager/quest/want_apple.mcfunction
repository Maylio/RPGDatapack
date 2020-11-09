###このfunctionはtalkから実行されています###

##################################
#交易できるリンゴのgiveコマンド
#give @s apple{talk_quest:"want_apple"} 64
##################################

#プレイヤーが見ている"talker"タグが付いている村人の名前を変える
data modify entity @e[limit=1,tag=talker,tag=!talk_finish,tag=quest_want_apple,sort=nearest] CustomName set value '{"text":"ありがとう！お礼にこれをあげよう"}'
#クエストを達成したら交易アイテム名を変える
data modify entity @e[limit=1,tag=talker,tag=!talk_finish,tag=quest_want_apple_first,sort=nearest] Offers.Recipes[{buy:{tag:{display:{Name:'{"text":"クエスト名：彼にリンゴを","color":"yellow"}'}}}}].buy.tag.display.Name set value '{"text":"達成済み：彼にリンゴを","color":"red"}'
#プレイヤーからアイテムを1つ消す
clear @s apple{talk_quest:"want_apple"} 1
#"quest_want_apple_first"タグをはく奪して初めてかどうかを区別する
tag @e[limit=1,tag=talker,tag=quest_want_apple_first,tag=!talk_finish,sort=nearest] remove quest_want_apple_first
#プレイヤーにアイテムを与える
give @s white_dye{talk_quest:"want_hifusaibou",display:{Name:'{"text":"田中さんの皮膚細胞","color":"yellow"}'}} 1