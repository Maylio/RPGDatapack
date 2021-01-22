#敵に耐性
effect give @e[tag=conbat_mob] resistance 100 100 true
#"set_status"タグが付いたMOBが居たら実行
execute as @e[tag=set_status] run function rpg:mobs/set_status

#ジャンプ攻撃の処理
execute as @e[tag=action_jumping] at @s run function rpg:mobs/actions/jumping_hub

#MOBの行動
    #ドリームスライム
    function rpg:mobs/dream_slime/actions
    #"slime_inc"が付いていないスライムを奈落に落とす
    tp @e[type=slime,tag=!slime_inc] ~ ~-1000 ~ 

    #ジェリーフィッシュ
    function rpg:mobs/squid/actions