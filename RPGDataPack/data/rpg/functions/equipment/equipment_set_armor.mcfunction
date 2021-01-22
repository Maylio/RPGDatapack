#設定されたタグから各部位のスコアに代入していく
execute as @s store result score #head conbat_defense run data get entity @s Inventory[{Slot:100b}].tag.armordefense
execute as @s store result score #chest conbat_defense run data get entity @s Inventory[{Slot:101b}].tag.armordefense
execute as @s store result score #leggings conbat_defense run data get entity @s Inventory[{Slot:102b}].tag.armordefense
execute as @s store result score #boots conbat_defense run data get entity @s Inventory[{Slot:103b}].tag.armordefense

#全部位のスコアを足す
scoreboard players operation #head conbat_defense += #chest conbat_defense
scoreboard players operation #head conbat_defense += #leggings conbat_defense
scoreboard players operation #head conbat_defense += #boots conbat_defense

#計算で出たスコアを実行者の防御力に代入
scoreboard players operation @s conbat_defense = #head conbat_defense


#スコアリセット
scoreboard players reset #head
scoreboard players reset #chest
scoreboard players reset #leggings
scoreboard players reset #boots