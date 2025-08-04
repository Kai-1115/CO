//Student ID: 113550021
`timescale 1ns/1ps
`include "MUX_2to1.v"
`include "MUX_4to1.v"

module ALU_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);
		
/* Write down your code HERE */
	wire a, b, results;
	MUX_2to1 m1(.src1(src1), .src2(~src1), .select(Ainvert), .result(a));
	MUX_2to1 m2(.src1(src2), .src2(~src2), .select(Binvert), .result(b));

	// 00: a or b, 01: a and b, 10: a add b, 11: a slt b
	MUX_4to1 m3(.src1(a | b), .src2(a & b), .src3(a ^ b ^ cin), .src4(less), .select(operation), .result(results));
	
	always @(*)
	begin 
		result <= results;
		cout <= (a & b) | (a & cin) | (b & cin);
	end

endmodule