# 2026/04/22 Wed

## Day 1 — 4-bit Adder
- 兩版本(assign + always_comb)+ testbench 通過 simulation
- 卡點:
  - Port list syntax:bit width 寫兩次、一行多個 width 混用
  - always_comb 不接 sensitivity list(跟 always_ff 搞混)
  - label 不能以數字開頭(4adder 違規)
  - HDL 不是 C:a + b + cin 一行就好,不要拆 if
- 判定:需複習(第一次寫,被點錯 4 次 syntax)

## 投遞
- 0 家

## ITRI
- 未開始

## Setup 完成
- Icarus Verilog + GTKWave 裝好
- VS Code workspace 開 axi-lite-uvm
- Copilot inline suggestions 關掉

## Day 2 — 4-to-1 Mux
- 兩版本(case + if-else)通過 simulation
- 卡點:
  - 2'b00 和 2b'00 搞反(單引號位置)
  - elsif 不存在,SV 用 else if
  - case 的 default: 後面有冒號
  - case 結束用 endcase 不是 end
  - module 名字忘了改
- 判定:需複習(被點錯 3 次關鍵 syntax)