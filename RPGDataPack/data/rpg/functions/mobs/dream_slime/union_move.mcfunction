###このfunctionはdream_slimeのactionsから実行されています###


#近くのスライムの方へ向かう
execute as @s[nbt={wasOnGround:false}] at @s[nbt={wasOnGround:false}] facing entity @e[tag=dream_slime,tag=!dream_slime_union,limit=1,sort=nearest] eyes positioned 0 0 0 rotated ~ 0 run summon area_effect_cloud ^ ^ ^1 {Tags:["pos"]}
execute store result entity @s[nbt={wasOnGround:false}] Motion[0] double 0.1 run data get entity @e[tag=pos,limit=1] Pos[0]
execute store result entity @s[nbt={wasOnGround:false}] Motion[2] double 0.1 run data get entity @e[tag=pos,limit=1] Pos[2]
kill @e[tag=pos]
#近くのスライムは"dream_slime"の方へ向かう
execute as @e[tag=dream_slime,tag=!dream_slime_union] at @s[nbt={wasOnGround:false}] facing entity @e[tag=dream_slime,tag=dream_slime_union,limit=1,sort=nearest] eyes positioned 0 0 0 rotated ~ 0 run summon area_effect_cloud ^ ^ ^1 {Tags:["pos"]}
execute as @e[tag=dream_slime,tag=!dream_slime_union] store result entity @s[nbt={wasOnGround:false}] Motion[0] double 0.1 run data get entity @e[tag=pos,limit=1] Pos[0]
execute as @e[tag=dream_slime,tag=!dream_slime_union] store result entity @s[nbt={wasOnGround:false}] Motion[2] double 0.1 run data get entity @e[tag=pos,limit=1] Pos[2]
kill @e[tag=pos]