#コマンドでプレイヤーを指定するためにタグをつける
tag @s add request_command_sender

#send_command
#コマンドをリセット
data modify block 8 4 8 Command set value ""
data modify block 8 5 8 Command set value ""
data modify block 8 6 8 Command set value ""
data modify block 8 7 8 Command set value ""
data modify block 8 8 8 Command set value ""
data modify block 8 9 8 Command set value "tag @a[tag=request_command_sender] remove request_command_sender"
#報酬で実行されるコマンドをコマブロに代入
execute if data entity @s SelectedItem.tag.request_step[0].reward[0].send_command run data modify block 8 4 8 Command set from entity @s SelectedItem.tag.request_step[0].reward[0].send_command
execute if data entity @s SelectedItem.tag.request_step[0].reward[1].send_command run data modify block 8 5 8 Command set from entity @s SelectedItem.tag.request_step[0].reward[1].send_command
execute if data entity @s SelectedItem.tag.request_step[0].reward[2].send_command run data modify block 8 6 8 Command set from entity @s SelectedItem.tag.request_step[0].reward[2].send_command
execute if data entity @s SelectedItem.tag.request_step[0].reward[3].send_command run data modify block 8 7 8 Command set from entity @s SelectedItem.tag.request_step[0].reward[3].send_command
execute if data entity @s SelectedItem.tag.request_step[0].reward[4].send_command run data modify block 8 8 8 Command set from entity @s SelectedItem.tag.request_step[0].reward[4].send_command
#コマンド実行
data modify block 8 4 8 auto set value true
data modify block 8 4 8 auto set value false
data modify block 8 5 8 auto set value true
data modify block 8 5 8 auto set value false
data modify block 8 6 8 auto set value true
data modify block 8 6 8 auto set value false
data modify block 8 7 8 auto set value true
data modify block 8 7 8 auto set value false
data modify block 8 8 8 auto set value true
data modify block 8 8 8 auto set value false
data modify block 8 9 8 auto set value true
data modify block 8 9 8 auto set value false

#villager_ward
#村人の名前に報酬で指定された名前を代入
execute if data entity @s SelectedItem.tag.request_step[0].reward[0].villager_ward run data modify entity @e[tag=target,limit=1] CustomName set from entity @s SelectedItem.tag.request_step[0].reward[0].villager_ward
execute if data entity @s SelectedItem.tag.request_step[0].reward[1].villager_ward run data modify entity @e[tag=target,limit=1] CustomName set from entity @s SelectedItem.tag.request_step[0].reward[1].villager_ward
execute if data entity @s SelectedItem.tag.request_step[0].reward[2].villager_ward run data modify entity @e[tag=target,limit=1] CustomName set from entity @s SelectedItem.tag.request_step[0].reward[2].villager_ward
execute if data entity @s SelectedItem.tag.request_step[0].reward[3].villager_ward run data modify entity @e[tag=target,limit=1] CustomName set from entity @s SelectedItem.tag.request_step[0].reward[3].villager_ward
execute if data entity @s SelectedItem.tag.request_step[0].reward[4].villager_ward run data modify entity @e[tag=target,limit=1] CustomName set from entity @s SelectedItem.tag.request_step[0].reward[4].villager_ward

#clear_item
#プレイヤーのオフハンド(納品したアイテム)を削除
execute if data entity @s SelectedItem.tag.request_step[0].reward[0].clear_item run replaceitem entity @s weapon.offhand air
execute if data entity @s SelectedItem.tag.request_step[0].reward[1].clear_item run replaceitem entity @s weapon.offhand air
execute if data entity @s SelectedItem.tag.request_step[0].reward[2].clear_item run replaceitem entity @s weapon.offhand air
execute if data entity @s SelectedItem.tag.request_step[0].reward[3].clear_item run replaceitem entity @s weapon.offhand air
execute if data entity @s SelectedItem.tag.request_step[0].reward[4].clear_item run replaceitem entity @s weapon.offhand air

#give_item
#コピー用のアイテム召喚
execute if data entity @s SelectedItem.tag.request_step[0].reward[0].give_item run summon item ~ ~ ~ {Tags:["give_item_0","summon_now"],Item:{id:"stone",Count:1b}}
execute if data entity @s SelectedItem.tag.request_step[0].reward[1].give_item run summon item ~ ~ ~ {Tags:["give_item_1","summon_now"],Item:{id:"stone",Count:1b}}
execute if data entity @s SelectedItem.tag.request_step[0].reward[2].give_item run summon item ~ ~ ~ {Tags:["give_item_2","summon_now"],Item:{id:"stone",Count:1b}}
execute if data entity @s SelectedItem.tag.request_step[0].reward[3].give_item run summon item ~ ~ ~ {Tags:["give_item_3","summon_now"],Item:{id:"stone",Count:1b}}
execute if data entity @s SelectedItem.tag.request_step[0].reward[4].give_item run summon item ~ ~ ~ {Tags:["give_item_4","summon_now"],Item:{id:"stone",Count:1b}}
#rewardからアイテムの情報に代入
execute if data entity @s SelectedItem.tag.request_step[0].reward[0].give_item run data modify entity @e[tag=give_item_0,tag=summon_now,limit=1] Item set from entity @s SelectedItem.tag.request_step[0].reward[0].give_item
execute if data entity @s SelectedItem.tag.request_step[0].reward[1].give_item run data modify entity @e[tag=give_item_1,tag=summon_now,limit=1] Item set from entity @s SelectedItem.tag.request_step[0].reward[1].give_item
execute if data entity @s SelectedItem.tag.request_step[0].reward[2].give_item run data modify entity @e[tag=give_item_2,tag=summon_now,limit=1] Item set from entity @s SelectedItem.tag.request_step[0].reward[2].give_item
execute if data entity @s SelectedItem.tag.request_step[0].reward[3].give_item run data modify entity @e[tag=give_item_3,tag=summon_now,limit=1] Item set from entity @s SelectedItem.tag.request_step[0].reward[3].give_item
execute if data entity @s SelectedItem.tag.request_step[0].reward[4].give_item run data modify entity @e[tag=give_item_4,tag=summon_now,limit=1] Item set from entity @s SelectedItem.tag.request_step[0].reward[4].give_item
tag @e[tag=summon_now] remove summon_now


#request_stepを次に進める
function rpg:request/next_request_step