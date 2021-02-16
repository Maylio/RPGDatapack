#武器を手に持っていた時攻撃力に代入
execute as @a[nbt={SelectedItem:{tag:{weapon:true}}}] run function rpg:equipment/equipment_set_weapon
#もし武器を持っていなかったら攻撃力を0にセット
execute as @a[nbt=!{SelectedItem:{tag:{weapon:true}}}] run scoreboard players set @s conbat_damage 0


#防具を着ていた時防御力に代入
execute as @a[nbt={Inventory:[{Slot:100b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:101b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:102b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:103b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
#もし何も装備していなかった場合防御力を0にセット
execute as @a[nbt=!{Inventory:[{Slot:100b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:101b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:102b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:103b,tag:{armor:true}}]}] run scoreboard players set @s conbat_defense 0