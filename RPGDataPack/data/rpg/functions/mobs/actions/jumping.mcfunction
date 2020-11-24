
#見てる座標をMotionに入れるために、0,0,0から見てる方向の前に"pos"を召喚
execute as @s at @s facing entity @p eyes positioned 0 0 0 rotated ~ 0 run summon area_effect_cloud ^ ^ ^1 {Duration:1,Radius:0f,Tags:[pos]}
#"pos"のX座標を10倍にしてX軸のMotionに代入
execute store result entity @s Motion[0] double 0.8 run data get entity @e[tag=pos,limit=1] Pos[0]
#YのMotionを設定
data modify entity @s Motion[1] set value 0.5d
#"pos"のZ座標を10倍にしてY軸のMotionに代入
execute store result entity @s Motion[2] double 0.8 run data get entity @e[tag=pos,limit=1] Pos[2]

#"pos"を削除
kill @e[tag=pos]

#ダメージ
    #"action_jumping"タグをつける
    tag @s add action_jumping
