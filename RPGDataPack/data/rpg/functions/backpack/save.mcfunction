#プレイヤーに拾わせる用のバックパックを召喚
summon item ~ ~ ~ {Tags:["backpack"],Item:{id:"minecraft:saddle",Count:1b,tag:{backpack:true}}}
#実行者とスコアが同じロバのチェストの中身をアイテムのタグに代入
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run data modify entity @e[type=item,tag=backpack,limit=1] Item.tag.backpackItems set from entity @s Items

#実行者とスコアが同じロバのチェストの中身を消す
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.0 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.1 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.2 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.3 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.4 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.5 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.6 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.7 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.8 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.9 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.10 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.11 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.12 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.13 air
execute as @e[tag=ui_donkey] if score @s setid_number = @a[tag=clear_backpack,limit=1] setid_number run replaceitem entity @s horse.14 air

#"clear_backpack"タグを削除
tag @s remove clear_backpack

#スコア比較用にタグ付け
tag @s add killer
#ロバの削除
function rpg:right_click_ui/kill