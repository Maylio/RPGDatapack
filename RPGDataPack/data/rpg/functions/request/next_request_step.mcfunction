#コピー用のアイテム召喚
summon item ~ ~ ~ {Tags:["request_copy","summon_now"],Item:{id:"paper",Count:1b}}

#プレイヤーの手に持っている依頼書から内容コピー
data modify entity @e[tag=request_copy,tag=summon_now,limit=1] Item set from entity @s SelectedItem
#依頼書を削除
replaceitem entity @s weapon.mainhand air

#コピーされた依頼書のrequest_stepの一番前を削除
data remove entity @e[tag=request_copy,tag=summon_now,limit=1] Item.tag.request_step[0]

#もしコピーされた依頼書のrequest_stepが空なら依頼を完了
execute unless data entity @e[tag=request_copy,tag=summon_now,limit=1] Item.tag.request_step[0] run function rpg:request/finish_request

#タグ削除
tag @e[tag=request_copy,tag=summon_now] remove summon_now
