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
# 2026/04/23 Thu

## Day 3 — 8-bit Register (Sync Reset + Enable)
- Sync reset:sensitivity list 只有 posedge clk
- 踩坑:port 沒寫 logic、q <= q 多餘、rst_n==0 寫成 !rst_n 更標準
- Simulation 6 case 全對
- 判定:需複習

## Day 4 — 8-bit Counter (Async Reset + Sync Clear + Enable)
- Async reset:sensitivity list = posedge clk or negedge rst_n
- 踩坑:cnt + 1 寫法有 width mismatch (應該 cnt + 8'd1)
- Simulation 8 case 全對,包含 async reset mid-clock 驗證
- Bonus:debug 過 testbench timing bug(#3 rst_n=0 沒等 propagation)
- 判定:一次過(近)

## Today's outstanding
- Pong Chu Ch 2 沒讀(推到 Fri)
- ITRI TX 釐清沒做(推到 Fri)
- 投遞沒做(推到 Fri)

## Weekly pattern note
- 今天上午幾乎白天浪費掉(朋友事情)
- 17:30-19:30 兩小時補上 2 題 RTL drills
- 策略:Layer 0 這種沒 external deadline 的工作,要排在一天的起點,不是「之後再做」
