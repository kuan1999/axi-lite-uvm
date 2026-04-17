# axi-lite-uvm
AXI-Lite slave peripheral on Zynq-7000 with UVM verification environment

# AXI-Lite Peripheral and UVM Verification Environment

Custom AXI-Lite slave register interface on Xilinx Zybo Z7-20 (Zynq-7000, Artix-7 PL),
connecting ARM Cortex-A9 PS to a PL-side PWM generator. Verified with a class-based
UVM testbench targeting 85%+ functional coverage.

## Status

- [ ] Phase 1 — RTL + directed testbench (target: May 2026)
- [ ] Phase 2 — UVM environment with coverage (target: July 2026)
- [ ] Phase 3 — SVA + regression (target: August 2026)

## Architecture
ARM PS (Cortex-A9)
|
| AXI-Lite (via GP port)
v
[AXI-Lite Slave Interface]
|
v
[Register File: 8 × 32-bit]
|
v
[PWM Generator]
|
v
External LED / scope probe

## Register Map

| Offset | Register  | R/W | Description                        |
|--------|-----------|-----|------------------------------------|
| 0x00   | CTRL      | R/W | bit 0: enable, bit 1: reset        |
| 0x04   | STATUS    | R   | bit 0: busy, bit 1: error          |
| 0x08   | PERIOD    | R/W | PWM period (clock cycles)          |
| 0x0C   | DUTY      | R/W | PWM duty cycle (0 – PERIOD)        |
| 0x10   | COUNTER   | R   | Current PWM counter value          |
| 0x14   | ID        | R   | Constant 0xDEADBEEF                |
| 0x18   | SCRATCH   | R/W | Test-only scratch register         |
| 0x1C   | RESERVED  | -   | Reserved                           |

## Planned UVM Components

- `axi_lite_agent` (sequencer, driver, monitor)
- `axi_lite_scoreboard` with reference register model
- `axi_lite_coverage` — address, data pattern, handshake timing
- Constrained-random sequences: write/read, back-to-back, illegal address
- SystemVerilog Assertions for AXI handshake protocol

## Tools

- Xilinx Vivado 2024.x
- SystemVerilog / UVM
- Target board: Zybo Z7-20
