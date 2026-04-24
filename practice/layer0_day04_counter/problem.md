Day 4 — 8-bit Up-Counter (Async Reset + Sync Clear + Enable)

Input:  clk, rst_n (async, low-active), en, clr (sync)
Output: cnt[7:0]

Behavior:
- rst_n = 0 (any time, async) → cnt = 0
- clr = 1 at posedge clk → cnt = 0
- en = 1 at posedge clk → cnt = cnt + 1
- otherwise → hold

Priority: rst_n > clr > en
