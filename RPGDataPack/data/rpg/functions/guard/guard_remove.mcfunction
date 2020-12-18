attribute @s generic.knockback_resistance modifier remove 1ff963e1-fd87-4d91-81dd-7a08330b9849
attribute @s generic.attack_damage modifier remove ee4b2f8b-2d47-4879-8398-10e67cb26bf9
attribute @s generic.attack_knockback modifier remove 9aed85bb-62af-48ae-809a-a460a2460ba1
attribute @s generic.attack_speed modifier remove 2278979b-369a-4088-961e-9e86ca567c21
attribute @s generic.movement_speed modifier remove 82cb8186-c4e4-4b75-bc2b-7c9b5a962f17
effect clear @s jump_boost
playsound ui.button.click master @s ~ ~ ~ 2 2
tag @s remove guard_player

scoreboard players set @s guard_cooltime 20