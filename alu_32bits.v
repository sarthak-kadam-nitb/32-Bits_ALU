`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College: MANIT Bhopal
// Engineer: Sarthak Kadam
// 
// Create Date: 05.09.2025 01:35:34
// Design Name: 32-bit ALU
// Module Name: alu_32bits
// Project Name: 32 Bits ALU Design Project
// Target Devices: FPGA / Simulation
// Tool Versions: Tested on Xilinx Vivado / ModelSim
// Description: 
//  This module implements a 32-bit Arithmetic and Logic Unit (ALU).
//  It supports the following operations based on the 3-bit select input:
//      000 - Bitwise NOT (on 'a')
//      001 - Bitwise OR  (a | b)
//      010 - Bitwise AND (a & b)
//      011 - Two's complement negation (-a)
//      100 - Addition (a + b)
//      101 - Subtraction (a - b)
//      110 - Multiplication (a * b)
//      111 - Division (a / b, with divide-by-zero protection)
// 
// Dependencies: 
//  None (standalone module).
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//  - Inputs and outputs are 32-bit wide.
//  - Output is declared as 'reg' since it is assigned inside always block.
//  - Uses Verilog-2001 always @(*) for combinational logic.
//  - Recommended bit ordering: [31:0] instead of [0:31] for readability.
// 
//////////////////////////////////////////////////////////////////////////////////

module alu_32bits(
    input  [31:0] a,   // first input
    input  [31:0] b,   // second input 
    input  [2:0]  sel, // three select lines 
    output reg [31:0] out // ALU output
);

always @(*) begin // executes whenever inputs change
    case(sel)
        3'b000: out = ~a;                   // Bitwise NOT
        3'b001: out = a | b;                // OR
        3'b010: out = a & b;                // AND
        3'b011: out = -a;                   // Two's complement negation
        3'b100: out = a + b;                // Addition
        3'b101: out = a - b;                // Subtraction
        3'b110: out = a * b;                // Multiplication
        3'b111: out = (b != 0) ? a / b : 0; // Division with zero check
        default: out = 32'b0;               // Default output = 0
    endcase
end 

endmodule
