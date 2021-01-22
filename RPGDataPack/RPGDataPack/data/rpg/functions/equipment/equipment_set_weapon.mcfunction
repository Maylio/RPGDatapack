#プレイヤーの持っているアイテムに設定されているタグからスコアに代入
execute as @s store result score @s conbat_damage run data get entity @s SelectedItem.tag.weapondamage