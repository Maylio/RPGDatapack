execute store result block -6 4 19 Items.[0].tag.AttributeModifiers.[0].Amount double 1 as @a run scoreboard players get @s status_hp
execute store result block -6 4 19 Items.[0].tag.AttributeModifiers.[1].Amount double 0.01 as @a run scoreboard players get @s status_speed
execute store result block -6 4 19 Items.[0].tag.AttributeModifiers.[2].Amount double 0.2 as @a run scoreboard players get @s status_attack
execute store result block -6 4 19 Items.[0].tag.AttributeModifiers.[3].Amount double 0.8 as @a run scoreboard players get @s status_armor
execute as @a[nbt=!{Inventory:[{Slot:103b}]}] run tellraw @s ["",{"text":"-----------------------------------------\n"},{"text":"\u653b\u6483\u529b =>  ","color":"dark_red"},{"score":{"name":"@s","objective":"status_attack"},"color":"white"},{"text":"\n\n"},{"text":"\u9632\u5fa1\u529b","color":"gold"},{"text":" =>","color":"gold"},{"text":"  ","color":"dark_red"},{"score":{"name":"@s","objective":"status_armor"}},{"text":"\n\n"},{"text":"\u4f53\u529b ","color":"green"},{"text":"  =>","color":"green"},{"text":"  ","color":"white"},{"score":{"name":"@s","objective":"status_hp"},"color":"white"},{"text":"\n\n"},{"text":"\u79fb\u52d5\u901f\u5ea6=>  ","color":"blue"},{"score":{"name":"@s","objective":"status_speed"},"color":"white"},{"text":"\n                                   "},{"text":"\u9589\u3058\u308b","color":"gray","clickEvent":{"action":"run_command","value":"/tellraw @s {\"text\":\"\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n\\n \\u0020\"}"}},{"text":"\n----------------------------------------- "}]
execute as @a[nbt=!{Inventory:[{Slot:103b}]}] run clear @s stone_button{setstasus:1}
execute as @a[nbt=!{Inventory:[{Slot:103b}]}] run playsound minecraft:ui.button.click master @s ~ ~ ~
execute as @a[nbt=!{Inventory:[{Slot:103b}]}] run kill @e[type=item,nbt={Item:{id:"minecraft:stone_button",Count:1b},Age:0s}]
execute as @a[nbt=!{Inventory:[{Slot:103b}]}] run loot replace entity @a armor.head mine -6 4 19 mainhand