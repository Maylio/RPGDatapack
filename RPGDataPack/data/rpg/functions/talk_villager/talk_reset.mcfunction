###このfunctionはmainから実行されています###


#召喚された村人にもとからセットしておいた1番目のアイテムの名前を村人の名前に代入
data modify entity @s CustomName set from entity @s Inventory[0].tag.display.Name
#"talker"タグをはく奪して元の状態に戻す
tag @s remove talker
#"talk_finish"タグをはく奪して元の状態に戻す
tag @s remove talk_finish
#"talk_name_different"をはく奪
tag @s remove talk_name_different