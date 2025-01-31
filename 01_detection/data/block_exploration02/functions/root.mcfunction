### 角をすり抜けない視線先ブロック探査 (functionループ)
# 好きな位置と向きで実行するとそこから視線上のブロックを探査する
# tags/blocks/throughに入っているブロックをスルーする

## 準備
# エンティティの召喚
execute unless entity 4fe002bb-0-0-0-1 run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos1],UUID:[I;1340080827,0,0,1]}
execute unless entity 4fe002bb-0-0-0-2 run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos2],UUID:[I;1340080827,0,0,2]}
execute unless entity 4fe002bb-0-0-0-3 run summon marker ~ ~ ~ {Tags:[blmo,blmo_pos,blmo_pos3],UUID:[I;1340080827,0,0,3]}
# エンティティ1をプレイヤーの視線をx軸で反転させた角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^2 positioned 0.0 ~ ~ positioned ^ ^ ^-1 facing 0.0 0.0 0.0 positioned as @s run tp 4fe002bb-0-0-0-1 ~ ~ ~ ~ ~
# エンティティ2をプレイヤーの角度のxy成分の角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 facing 0.0 0.0 ~ positioned as @s run tp 4fe002bb-0-0-0-2 ~ ~ ~ ~ ~
# エンティティ3をプレイヤーの角度のzy成分の角度にする
execute positioned 0.0 0.0 0.0 positioned ^ ^ ^-1 facing ~ 0.0 0.0 positioned as @s run tp 4fe002bb-0-0-0-3 ~ ~ ~ ~ ~

## ループの開始
# 探査距離の上限 m
scoreboard players set #loop _ 25
# ループの開始
# プレイヤーから実行する前提でanchoredがついているので注意
execute anchored eyes positioned ^ ^ ^0.5 run function block_exploration02:1

## 終了
kill 4fe002bb-0-0-0-1
kill 4fe002bb-0-0-0-2
kill 4fe002bb-0-0-0-3