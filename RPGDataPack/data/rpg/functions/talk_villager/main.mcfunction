###このfunctionはtick.jsonで実行されています###


##############################################
#大雑把にどう動いているか
##############################################
#村人を召喚する際にインベントリの１番目に自分の名前を書いたアイテムを入れておく
#           ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#
#近づいてスニークしたプレイヤーがいたらランダムに喋らせる言葉が入ったアイテムを選んで村人の2番目のスロットにセット
#           ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#
#セットされたアイテムの名前からから村人の名前に代入
#           ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
#
#プレイヤーが離れたら1番目に入ったアイテムの名前を村人の名前に代入
##############################################
#村人召喚テンプレート
#summon villager ~ ~1 ~ {VillagerData:{profession:farmer,level:99,type:plains},Invulnerable:1b,CustomNameVisible:1b,Tags:["talk_can","quest_want_apple","quest_want_apple_first","quest_want_hifusaibou"],Offers:{Recipes:[{buy:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"クエスト名：彼にリンゴを","color":"yellow"}',Lore:['{"text":"回数制限：なし、クエスト難易度：優しい"}','{"text":"あ～新鮮でシャキシャキしたリンゴが食べたいなぁ・・・持ってきてくれたら特別なものを上げよう"}']},HideFlags:63,Enchantments:[{id:"minecraft:protection",lvl:0s}]}},sell:{id:"minecraft:white_dye",Count:1b,tag:{display:{Name:'{"text":"報酬：田中さんの皮膚細胞","color":"yellow"}'}}}},{buy:{id:"minecraft:paper",Count:1b,tag:{display:{Name:'{"text":"クエスト名：不要な「何か」","color":"yellow"}',Lore:['{"text":"回数制限：1回、クエスト難易度：優しい"}','{"text":"いらないものがあったら持ってきて！気に入ったら引き取るよ"}']},HideFlags:63,Enchantments:[{id:"minecraft:protection",lvl:0s}]}}}]},CustomName:'{"text":"田中さん","color":"yellow"}',Inventory:[{id:"minecraft:stone",Count:1b,tag:{display:{Name:'{"text":"田中さん","color":"yellow"}'},rewardExp:0b,maxUses:9999999}}]}
##############################################


##############################################
#スコア
##############################################
#talk_villager :スニーク検知
#talk_villager2:スニーク検知
#talk_right    :村人右クリック検知
##############################################
#タグ
##############################################
#talk_can           :このタグがついてると喋れるタグ
#talker             :talkのfunction内で話している村人を識別するためのタグ
#talk_name_different:名前が本来の名前じゃない場合付与されるタグ
#talk_finish        :スニークしている間喋り続けないようにスニークを離すまで付くタグ
#quest_want_###　　　　　　:アイテムを渡すクエストを持っていると付くタグ
##############################################



#村人に話しかける(shift)
##############################################
    #スニークしているプレイヤーの範囲内に"talk_can"タグが付いていて、"talk_finish"が付いていない村人が居たら"talk"を実行
execute as @a[scores={talk_villager=1..}] at @s if entity @e[tag=talk_can,tag=!talk_finish,limit=1,sort=nearest,distance=..4.99] run function rpg:talk_villager/talk
##############################################
    #スニーク検知用を0..2に納める
scoreboard players remove @a[scores={talk_villager=2..}] talk_villager2 1
    #スニークしていなかったら最寄りの村人の"talk_finish"タグを外してもう一度喋れるようにする
execute if entity @a[scores={talk_villager2=..0}] run tag @e[tag=talk_finish] remove talk_finish
    #スニークしていなかったらスコアをリセット
scoreboard players reset @a[scores={talk_villager2=..0}] talk_villager
scoreboard players reset @a[scores={talk_villager2=..0}] talk_villager2

#村人から離れると名前に切替
execute as @e[tag=talk_name_different] at @s unless entity @a[distance=..5] run function rpg:talk_villager/talk_reset

#名前が非表示されている村人の近くにプレイヤーが居たら名前を表示にする
execute as @e[tag=talk_can] at @s if entity @a[distance=..8] run data modify entity @s CustomNameVisible set value 1b

#名前が表示されている村人の近くにプレイヤーが居なかったら名前を非表示にする
execute as @e[tag=talk_can,nbt={CustomNameVisible:1b}] at @s unless entity @a[distance=..10] run data modify entity @s CustomNameVisible set value 0b

#村人を右クリックしたときに名前をリセット
execute as @a[scores={talk_right=1..}] at @s run function rpg:talk_villager/talk_reset_right