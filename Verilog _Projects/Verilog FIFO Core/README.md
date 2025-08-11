# Verilog FIFO Core

A simple, synthesizable First-In First-Out (FIFO) buffer implemented in Verilog. This project includes a clean RTL design and a testbench for behavioral simulation using Vivado.

---

## 📦 Features

- Parameterized data width and depth
- Synchronous read/write operations
- `full` and `empty` status flags
- Clean, synthesizable RTL
- Behavioral testbench for simulation

---

## 🧠 Design Overview

The FIFO uses a register array to store data, with read and write pointers to manage flow. A counter tracks occupancy to control `full` and `empty` flags.

### Parameters
- `DATA_WIDTH`: Width of each data word (default: 8 bits)
- `DEPTH`: Number of entries in the FIFO (default: 16)

### Ports
| Name       | Direction | Description              |
|------------|-----------|--------------------------|
| `clk`      | input     | Clock signal             |
| `rst`      | input     | Active-high reset        |
| `write_en` | input     | Write enable             |
| `read_en`  | input     | Read enable              |
| `data_in`  | input     | Data to write            |
| `data_out` | output    | Data read from FIFO      |
| `full`     | output    | FIFO is full             |
| `empty`    | output    | FIFO is empty            |

---

## 🧪 Simulation

### Tool: Vivado