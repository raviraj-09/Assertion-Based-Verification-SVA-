# 4-bit Counter Verification using SystemVerilog Assertions (SVA)

## Overview

This project demonstrates the functional verification of a synchronous 4-bit binary counter using **SystemVerilog Assertions (SVA)**. The objective is to verify the correct behavior of the counter under different operating conditions such as reset, counting, hold, and overflow.

The project is intended for beginners in Design Verification and provides a practical introduction to writing concurrent assertions without using the UVM framework.

---

## Features

- 4-bit synchronous up counter
- Active-high synchronous reset
- Enable-controlled counting
- Counter wraps from 15 to 0
- Verification using SystemVerilog Assertions
- Simple SystemVerilog testbench
- Compatible with Xilinx Vivado Simulator

---

## Project Structure

```
4-bit-Counter-Verification-using-SVA/
│
├── rtl/
│   └── counter4.v
│
├── tb/
│   └── counter_tb.sv
│
├── assertions/
│   └── counter_assertion.sv
│
├── simulation/
│   └── waveform.png
│
├── README.md
└── LICENSE
```

---

## Design Specification

### Inputs

| Signal | Description |
|---------|-------------|
| clk | System Clock |
| reset | Active High Reset |
| enable | Counter Enable |

### Output

| Signal | Description |
|---------|-------------|
| count[3:0] | 4-bit Counter Output |

---

## Counter Operation

| Reset | Enable | Counter Operation |
|--------|---------|------------------|
| 1 | X | Counter resets to 0 |
| 0 | 1 | Counter increments by 1 |
| 0 | 0 | Counter holds previous value |
| Count = 15 | Enable = 1 | Counter wraps to 0 |

---

## Assertions Implemented

### Reset Check

Verifies that the counter becomes zero whenever reset is asserted.

```systemverilog
property RESET_CHECK;
    @(posedge clk)
    reset |=> (count == 4'd0);
endproperty

assert property(RESET_CHECK);
```

---

### Increment Check

Checks that the counter increments correctly when enable is high.

```systemverilog
property INCREMENT_CHECK;

@(posedge clk)
disable iff(reset)

(enable && $past(count)!=4'd15)
|=>
(count==$past(count)+1);

endproperty

assert property(INCREMENT_CHECK);
```

---

### Overflow Check

Verifies that the counter wraps from 15 to 0.

```systemverilog
property OVERFLOW_CHECK;

@(posedge clk)
disable iff(reset)

(enable && $past(count)==4'd15)
|=>
(count==4'd0);

endproperty

assert property(OVERFLOW_CHECK);
```

---

### Hold Check

Ensures that the counter value remains unchanged when enable is low.

```systemverilog
property HOLD_CHECK;

@(posedge clk)
disable iff(reset)

!enable
|=>
(count==$past(count));

endproperty

assert property(HOLD_CHECK);
```

---

## Simulation

### Test Sequence

1. Apply Reset
2. Release Reset
3. Enable Counter
4. Count from 0 to 15
5. Verify Overflow
6. Disable Counter
7. Verify Hold Condition

---

## Expected Counter Output

| Clock Cycle | Count |
|--------------|-------|
| 0 | 0000 |
| 1 | 0001 |
| 2 | 0010 |
| 3 | 0011 |
| ... | ... |
| 14 | 1110 |
| 15 | 1111 |
| 16 | 0000 |

---

## Simulation Result

All assertions pass successfully during simulation.

Example simulator output:

```
Assertion RESET_CHECK Passed
Assertion INCREMENT_CHECK Passed
Assertion OVERFLOW_CHECK Passed
Assertion HOLD_CHECK Passed
```

---

## Tools Used

- Verilog HDL
- SystemVerilog
- SystemVerilog Assertions (SVA)
- Xilinx Vivado Simulator

---

## Learning Outcomes

This project demonstrates:

- RTL Design Verification
- Writing Concurrent Assertions
- Usage of `$past()`
- Implication Operators (`|->` and `|=>`)
- `disable iff`
- Assertion-based Verification (ABV)
- Counter Functional Verification

---

## Future Enhancements

- Randomized Testbench
- Functional Coverage
- Interface-based Verification
- UVM Testbench
- Formal Verification

---

## Author

**Ravi Raj**

M.Tech (VLSI Design)

---

## License

This project is released under the MIT License.
