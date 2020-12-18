execute as @a[nbt={SelectedItem:{tag:{weapon:true}}}] run function rpg:equipment/equipment_set_weapon
execute as @a[nbt=!{SelectedItem:{tag:{weapon:true}}}] run scoreboard players set @s conbat_damage 0

execute as @a[nbt={Inventory:[{Slot:100b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:101b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:102b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt={Inventory:[{Slot:103b,tag:{armor:true}}]}] run function rpg:equipment/equipment_set_armor
execute as @a[nbt=!{Inventory:[{Slot:100b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:101b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:102b,tag:{armor:true}}]},nbt=!{Inventory:[{Slot:103b,tag:{armor:true}}]}] run scoreboard players set @s conbat_defense 0