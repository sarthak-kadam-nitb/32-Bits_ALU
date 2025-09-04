# 32-bit ALU (Arithmetic Logic Unit)

## Why 32-bit ALU is Important
1. **Standard in Modern Processors**  
   - Most modern CPUs and embedded processors (ARM Cortex-M, MIPS, RISC-V) operate on **32-bit data paths**.  
   - A 32-bit ALU can process integers up to \(2^{32}-1\), which is essential for handling large data values efficiently.  

2. **Balanced Complexity vs. Performance**  
   - An **8-bit ALU** (like in Intel 8085) is simple but limited in range.  
   - A **64-bit ALU** (used in high-end CPUs) is powerful but adds more hardware complexity.  
   - A **32-bit ALU** provides the right balance — widely used in microcontrollers, DSPs, and general-purpose processors.  

3. **Foundation for Larger Architectures**  
   - Once you understand a 32-bit ALU, scaling to 64-bit or customizing for specific instruction sets becomes easier.  
   - It serves as a learning model for **datapath design** in computer architecture.  

---

## How I Implemented the 32-bit ALU
1. **Inputs and Outputs**  
   - Two **32-bit inputs**: `a` and `b`.  
   - One **3-bit select line (`sel`)** to choose the operation.  
   - One **32-bit output (`out`)** storing the result.  

2. **Combinational Logic (always @(*))**  
   - The ALU is purely **combinational**, meaning the output updates instantly when inputs or `sel` change.  
   - Implemented using a **case statement** for readability and modularity.  

3. **Operations Supported**  
   - **Logical Operations**: NOT, AND, OR.  
   - **Arithmetic Operations**: Negation, Addition, Subtraction, Multiplication, Division.  
   - **Error Handling**: Division includes a zero-check (`(b != 0) ? a/b : 0`).  

4. **Testbench**  
   - A separate Verilog testbench (`alu_32_bits_tb.v`) applies different values of `a`, `b`, and `sel`.  
   - Used `#10` delays to observe transitions between operations.  
   - Inputs chosen (`a=3`, `b=5`) for clarity and easy validation of results.  

5. **Bit-Width Choice**  
   - Declared as `reg [31:0]` and `wire [31:0]` to explicitly represent 32-bit wide data.  
   - This ensures consistency across arithmetic and logical operations.  

---

**In short:**  
This project implements a **processor-like building block** (the ALU) in Verilog, where **32-bit width** makes it aligned with industry standards and real-world processor architectures.
