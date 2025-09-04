`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// College: MANIT Bhopal
// Engineer: Sarthak Kadam
// 
// Create Date: 05.09.2025 01:50:05
// Design Name: 32-bit ALU Testbench
// Module Name: alu_32_bits_tb
// Project Name: 32 Bits ALU Design Project
// Target Devices: FPGA / Simulation
// Tool Versions: Tested on Xilinx Vivado / ModelSim
// Description: 
//  This is the testbench for the 32-bit ALU (alu_32bits).
//  It applies a set of test vectors to verify all ALU operations:
//      - NOT, OR, AND, NEGATION
//      - ADDITION, SUBTRACTION, MULTIPLICATION, DIVISION
//  Inputs 'a' and 'b' are initialized with test values (3 and 5).
//  The select line 'sel' is varied to check each operation.
// 
// Dependencies: 
//  Requires alu_32bits.v (ALU design module).
// 
// Revision:
// Revision 0.01 - File Created (Basic testbench implemented)
// Additional Comments:
//  Extend test cases with more input values to ensure full coverage.
//  Use $monitor or $display for automatic output printing.
//////////////////////////////////////////////////////////////////////////////////

module alu_32_bits_tb;

reg [31:0] a;
reg [31:0] b;
reg [2:0]  sel;
wire [31:0] out;

// Instantiate ALU (Unit Under Test)
alu_32bits uut (
    .a(a), 
    .b(b), 
    .sel(sel), 
    .out(out)
);

initial begin
    // Initialize inputs
    a = 32'h00000003; // let a = 3
    b = 32'h00000005; // let b = 5

    // Apply test cases
    sel = 3'b000; #10; // NOT
    sel = 3'b001; #10; // OR
    sel = 3'b010; #10; // AND
    sel = 3'b011; #10; // NEGATION
    sel = 3'b100; #10; // ADDITION
    sel = 3'b101; #10; // SUBTRACTION
    sel = 3'b110; #10; // MULTIPLICATION 
    sel = 3'b111; #10; // DIVISION

    $stop; // end simulation
end

endmodule
