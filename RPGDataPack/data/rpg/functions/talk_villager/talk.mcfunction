###このfunctionはmainから実行されています###


##############################################
#大雑把にどう動いているか
##############################################
#実行者が見ている村人にタグをつけてloot_tableで名前にセリフを代入
#           ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#
#特殊なアイテムを持っていた場合questのfunctionを実行
#           ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#
#               各種タグを追加
##############################################

#実行者が見ている"talk_can"タグが付いた村人に"talker"タグをつける
execute as @s at @s anchored eyes facing entity @e[limit=1,tag=talk_can,tag=!talk_finish,sort=nearest] eyes anchored feet positioned ^ ^ ^1 rotated as @s positioned ^ ^ ^-1 if entity @s[distance=..0.3] run tag @e[limit=1,tag=talk_can,tag=!talk_finish,sort=nearest] add talker
#プレイヤーの方向を向かせる
execute at @e[tag=talker] run tp @e[tag=talker] ~ ~ ~ facing entity @s
#"talker"タグがついていて"talk_finish"タグが付いていない村人の2番インベントリに喋らせる内容が入ったアイテムを入れる
execute as @e[tag=talker,tag=!talk_finish] run loot replace entity @s villager.1 loot rpg:talk_villager/villager_nomal
#"talker"タグがついていて"talk_finish"タグが付いていない村人の名前に2番インベントリに入っているアイテムの名前を代入
execute as @e[tag=talker,tag=!talk_finish] run data modify entity @s CustomName set from entity @s Inventory[1].tag.display.Name
##############################################
#もしもプレイヤーが"talk_quest:"want_apple""のタグがついたアイテムを持っていて、村人に"quest_want_apple"タグがついていたら特殊なイベントを起こす
execute if entity @e[tag=talker,tag=!talk_finish,tag=quest_want_apple] as @s[nbt={SelectedItem:{tag:{talk_quest:"want_apple"}}}] run function rpg:talk_villager/quest/want_apple
#もしもプレイヤーが"talk_quest:"want_hifusaibou""のタグがついたアイテムを持っていて、村人に"quest_want_hifusaibou"タグがついていたら特殊なイベントを起こす
execute if entity @e[tag=talker,tag=!talk_finish,tag=quest_want_hifusaibou] as @s[nbt={SelectedItem:{tag:{talk_quest:"want_hifusaibou"}}}] run function rpg:talk_villager/quest/want_hifusaibou
##############################################
#"talker"タグがついていて"talk_finish"タグが付いていない村人の場所で音を出す
execute as @e[tag=talker,tag=!talk_finish] at @s run playsound minecraft:entity.villager.ambient master @a ~ ~ ~
#名前のリセット用に"talk_name_different"タグを付与
execute as @e[tag=talker,tag=!talk_finish] run tag @s add talk_name_different
#名前が変わり続けないように"talk_finish"タグを付与
execute as @e[tag=talker,tag=!talk_finish] run tag @s add talk_finish
#"talker"タグをはく奪
execute as @e[tag=talker] run tag @s remove talker
