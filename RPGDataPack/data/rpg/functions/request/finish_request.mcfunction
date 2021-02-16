#演出
tag @s add me
title @a times 20 100 20
title @a subtitle ["",{"text":" \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020 \u0020"},{"text":"\u0020\u4f9d\u983c\u5b8c\u4e86\uff1a","color":"light_purple","bold":true,"underlined":true},{"entity":"@e[tag=request_copy,tag=summon_now,limit=1]","nbt":"Item.tag.request_name","color":"red","bold":true,"underlined":true}]
title @a title {"text":" "}
playsound minecraft:ui.toast.challenge_complete master @a ~ ~ ~ 0.5 1
tag @s remove me

#依頼書削除
kill @e[tag=request_copy,tag=summon_now]