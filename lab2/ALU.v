//Student ID: 113550021
`timescale 1ns/1ps
`include "ALU_1bit.v"
module ALU(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);
	
/* Write down your code HERE */
	
	wire a, b; // a and b of ALU_31
	assign a = (ALU_control[3]) ? ~src1[31] : src1[31];
	assign b = (ALU_control[2]) ? ~src2[31] : src2[31];


	wire [31:0] carry_out, results;
	ALU_1bit ALU_0(.src1(src1[0]), .src2(src2[0]), .less(a ^ b ^ carry_out[30]), 
	.Ainvert(ALU_control[3]), .Binvert(ALU_control[2]), .cin(ALU_control[2]), 
	.operation(ALU_control[1:0]), .result(results[0]), .cout(carry_out[0]));

	wire less = 0;
	ALU_1bit ALU_1to31[31:1] (src1[31:1], src2[31:1], less, ALU_control[3], 
	ALU_control[2], carry_out[30:0], ALU_control[1:0], results[31:1], carry_out[31:1]);

	always@ (*) 
	begin
		result <= results;
		if (ALU_control[1:0] == 2'b10) // if add or sub
		begin
			cout <= carry_out[31];
			overflow <= carry_out[31] ^ carry_out[30];
		end 
		else // if not add or sub, cout = overflow = 0
		begin
			cout <= 0;
			overflow <= 0;
		end	
		zero <= (result == 0);
	end
endmodule