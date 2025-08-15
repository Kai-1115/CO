// ID: 113550021
module Adder(
    src1_i,
	src2_i,
	sum_o
	);

// TO DO
input [31:0] src1_i, src2_i;
output [31:0] sum_o;
wire [31:0] sum_o;

assign sum_o = src1_i + src2_i;

endmodule                  