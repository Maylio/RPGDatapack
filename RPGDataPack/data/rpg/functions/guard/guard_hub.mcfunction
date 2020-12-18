scoreboard players remove @a[scores={guard_cooltime=-2147483648..2147483647}] guard_cooltime 1
execute as @a[scores={guard_cooltime=..0}] at @s run playsound minecraft:entity.experience_orb.pickup master @s ~ ~ ~ 2 2
scoreboard players reset @a[scores={guard_cooltime=..0}] guard_cooltime

execute as @a[scores={guard_shift=1},tag=!guard_player,nbt={SelectedItem:{tag:{weapon:true}}}] unless score @s guard_cooltime matches -2147483648..2147483647 run function rpg:guard/guard_add
execute as @a[tag=guard_player] unless score @s guard_shift matches 1..10 run function rpg:guard/guard_remove

execute as @a unless entity @s[scores={guard_shift_t=-2147483648..2147483647}] run scoreboard players reset @a guard_shift
scoreboard players reset @a guard_shift_t