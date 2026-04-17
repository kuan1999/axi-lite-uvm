# axi-lite-uvm

Self-directed learning project: AXI-Lite slave peripheral on Xilinx Zybo Z7-20
(Zynq-7000 SoC, Artix-7 PL), with a PWM generator as the downstream logic.

**Current status (April 2026):** Early planning — architecture and register map
drafted. RTL implementation has not started yet. See roadmap for honest progress.

## Goals

Build hands-on skills in:
- RTL design in SystemVerilog (AXI-Lite slave, PWM generator)
- Directed simulation with Vivado XSim
- UVM-based functional verification (later phase)

## Design Overview

The ARM Cortex-A9 processor on the Zynq PS drives an AXI-Lite slave on the PL side.
The slave exposes 8 memory-mapped 32-bit registers used to configure a PWM
generator (period, duty cycle) and read back status.

'''ARM PS (Cortex-A9)
│
│  AXI-Lite bus
▼
┌─────────────────────┐
│ AXI-Lite Slave IF   │
└─────────┬───────────┘
│
▼
┌─────────────────────┐
│ Register File       │  8 × 32-bit
└─────────┬───────────┘
│
▼
┌─────────────────────┐
│ PWM Generator       │
└─────────┬───────────┘
│
▼
PWM output'''

## Register Map (draft)

| Offset | Register | R/W | Description                         |
|--------|----------|-----|-------------------------------------|
| 0x00   | CTRL     | R/W | bit 0: enable, bit 1: soft reset    |
| 0x04   | STATUS   | R   | bit 0: busy, bit 1: error           |
| 0x08   | PERIOD   | R/W | PWM period in clock cycles          |
| 0x0C   | DUTY     | R/W | PWM duty cycle (0 to PERIOD)        |
| 0x10   | COUNTER  | R   | Current PWM counter value           |
| 0x14   | ID       | R   | Constant 0xDEADBEEF (sanity check)  |
| 0x18   | SCRATCH  | R/W | Read/write scratch for testbench    |
| 0x1C   | RESERVED | -   | Reserved                            |

## Roadmap

- [ ] **Phase 1** — RTL + directed testbench (target: late May 2026)
- [ ] **Phase 2** — UVM verification environment (target: July 2026)
- [ ] **Phase 3** — Assertions + regression (target: August 2026)

Detailed design notes will be added to `docs/` as each phase progresses.

## Tools

- Xilinx Vivado 2024.x
- SystemVerilog
- Target board: Zybo Z7-20 (Zynq-7000, Artix-7 PL)

## Repository Layout
'''
axi-lite-uvm/
├── rtl/            # RTL source
├── tb_directed/    # Directed testbench (Phase 1)
├── tb_uvm/         # UVM environment (Phase 2)
├── docs/           # Design notes
├── constraints/    # XDC files
├── scripts/        # Vivado TCL scripts
└── sim/            # Local simulation runs (gitignored)
'''
## Author

Hsiang-Yung (William) Kuan — M.Eng. CS, Oregon State University
