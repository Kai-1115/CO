// ID: 113550021
module Shift_Left_Two_32(
    data_i,
    data_o
    );

// TO DO
input [31:0] data_i;
output reg [31:0] data_o;

always @(*)
begin 
    data_o = {data_i[29:0], 2'b00};
end 
endmodule
