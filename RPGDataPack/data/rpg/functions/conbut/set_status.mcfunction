#################################################################################################
#攻撃力
    #MOBのポータルのクールダウンの上2ケタを"conbut_damage"と"mob_PortalCooldowntick"に代入
    execute store result score @s conbut_damage run data get entity @s PortalCooldown 0.0001
    execute store result score #mob_PortalCooldowntick _ run data get entity @s PortalCooldown
    tellraw @a [{"text":"攻撃力:"},{"score":{"name":"@s","objective":"conbut_damage"}}]

    #計算
        #計算用に100を用意
        scoreboard players set #10000 _ 10000
        #"mob_damage"のダミープレイヤーに"conbut_damage"の値を代入
        scoreboard players operation #mob_damage _ = @s conbut_damage
        #"mob_damage"を10000倍に
        scoreboard players operation #mob_damage _ *= #10000 _
        #"mob_PortalCooldowntick"から"mob_power"を減算
        scoreboard players operation #mob_PortalCooldowntick _ -= #mob_damage _

    #MOBのポータルのクールダウンの上2ケタをなくす
    execute store result entity @s PortalCooldown short 1 run scoreboard players get #mob_PortalCooldowntick _

    #スコアのリセット
    scoreboard players reset #10000
    scoreboard players reset #mob_damage
    scoreboard players reset #mob_PortalCooldowntick
#################################################################################################

#################################################################################################
#防御力
    #MOBのポータルのクールダウンの下2ケタを"conbut_defense"と"mob_PortalCooldowntick"に代入
    execute store result score @s conbut_defense run data get entity @s PortalCooldown 0.01
    execute store result score #mob_PortalCooldowntick _ run data get entity @s PortalCooldown
    tellraw @a [{"text":"防御力:"},{"score":{"name":"@s","objective":"conbut_defense"}}]

    #計算
        #計算用に1を用意
        scoreboard players set #100 _ 100
        #"mob_defense"のダミープレイヤーに"conbut_defense"の値を代入
        scoreboard players operation #mob_defense _ = @s conbut_defense
        #"mob_defense"を100倍に
        scoreboard players operation #mob_defense _ *= #100 _
        #"mob_PortalCooldowntick"から"mob_defense"を減算
        scoreboard players operation #mob_PortalCooldowntick _ -= #mob_defense _

    #MOBのポータルのクールダウンの下2ケタをなくす
    execute store result entity @s PortalCooldown short 1 run scoreboard players get #mob_PortalCooldowntick _

    #スコアのリセット
    scoreboard players reset #100
    scoreboard players reset #mob_defense
    scoreboard players reset #mob_PortalCooldowntick
#################################################################################################

#################################################################################################
#HP
    #MOBのポータルのクールダウンの下2ケタをMOBのHPと"mob_PortalCooldowntick"に代入
    execute store result entity @s Attributes[{Name:"minecraft:generic.max_health"}].Base double 1 run data get entity @s PortalCooldown

    #MOBのポータルのクールダウンをなくす
    data modify entity @s PortalCooldown set value 0.0f

#################################################################################################
    #タグはく奪
    tag @s remove set_status