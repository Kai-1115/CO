// ID: 113550021
module MUX_2to1(
               data0_i,
               data1_i,
               select_i,
               data_o
               );

// TO DO
parameter size = 0;

input [size-1:0] data0_i, data1_i;
input select_i;
output reg [size-1:0] data_o;

always @(*)
begin
    case(select_i)
        1'b0: data_o = data0_i;
        1'b1: data_o = data1_i;
    endcase
end
endmodule      
