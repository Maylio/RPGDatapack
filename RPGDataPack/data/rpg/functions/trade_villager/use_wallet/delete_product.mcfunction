#村人から足りないことを告げられる
title @s actionbar {"entity":"@s","nbt":"Inventory[{tag:{product:true}}].tag.fail_word"}

#プレイヤーから偽の商品を削除
clear @s #rpg:allitems{product:true}

#財布を与える
give @s minecart{display:{Name:'{"text":"お財布","color":"yellow"}'},wallet:true} 1