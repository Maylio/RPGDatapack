#バックパックを開いたプレイヤーにタグ付け
tag @s add ui_opener
#高さ0にロバを召喚
summon minecraft:donkey ~ 0 ~ {CustomName:'{"text":" "}',DeathLootTable:"null",DeathTime:19,Invulnerable:1b,NoGravity:1b,Silent:1b,NoAI:1b,Tags:["ui_donkey","setid"],Team:"collision",Tame:1b,ChestedHorse:1b,SaddleItem:{id:"minecraft:saddle",Count:1b},ActiveEffects:[{Id:14b,Amplifier:10b,Duration:2000000,ShowParticles:0b}]}
#実行者にIDを割り振り
function setid:set
#実行者のIDを"setid"タグがついたロバにコピー
scoreboard players operation @e[tag=setid] setid_number = @s setid_number
#ロバの"setid"をはく奪
tag @e[tag=setid] remove setid
#スコアの比較用にタグ付け
tag @s add summoner