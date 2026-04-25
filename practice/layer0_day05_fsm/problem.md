Day 5 — Traffic Light FSM

States: RED → RED_YELLOW → GREEN → YELLOW → RED (Moore)

每個 state 持續固定 N cycles (parameter):
- RED:        10 cycles
- RED_YELLOW:  2 cycles
- GREEN:       8 cycles
- YELLOW:      2 cycles

Input:  clk, rst_n (async active-low)
Output: light[2:0]
  - S_RED:     3'b100
  - S_RED_YEL: 3'b110
  - S_GREEN:   3'b001
  - S_YELLOW:  3'b010

寫 3 個 always block:
- Block 1 (always_ff): state register
- Block 2 (always_comb): next-state logic (帶 timer)
- Block 3 (always_comb): Moore output logic

Module: traffic_fsm
Parameters: TIME_RED, TIME_R_Y, TIME_GREEN, TIME_YELLOW