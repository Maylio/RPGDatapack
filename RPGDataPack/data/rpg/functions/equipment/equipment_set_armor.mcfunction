scoreboard players reset @s conbat_defense

execute as @s store result score #head conbat_defense run data get entity @s Inventory[{Slot:100b}].tag.armordefense
execute as @s store result score #chest conbat_defense run data get entity @s Inventory[{Slot:101b}].tag.armordefense
execute as @s store result score #leggings conbat_defense run data get entity @s Inventory[{Slot:102b}].tag.armordefense
execute as @s store result score #boots conbat_defense run data get entity @s Inventory[{Slot:103b}].tag.armordefense

scoreboard players operation #head conbat_defense += #chest conbat_defense
scoreboard players operation #head conbat_defense += #leggings conbat_defense
scoreboard players operation #head conbat_defense += #boots conbat_defense

scoreboard players operation @s conbat_defense += #head conbat_defense

scoreboard players reset #head
scoreboard players reset #chest
scoreboard players reset #leggings
scoreboard players reset #boots