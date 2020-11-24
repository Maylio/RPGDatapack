#敵に耐性
effect give @e[tag=conbut_mob] resistance 100 100 true
#"set_status"タグが付いたMOBが居たら実行
execute as @e[tag=set_status] run function rpg:mobs/set_status


#MOBの行動
    #ドリームスライム
    function rpg:mobs/dream_slime/actions