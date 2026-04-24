Day 3 — 8-bit Register (Sync Reset + Enable)

Input:  clk, rst_n (sync), en, d[7:0]
Output: q[7:0]

Behavior:
- rst_n = 0 at posedge clk → q = 0
- rst_n = 1 and en = 1 → q = d
- rst_n = 1 and en = 0 → q hold
