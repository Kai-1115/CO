// ID: 113550021
module Sign_Extend(
    data_i,
    data_o
    );
               
// TO DO
input [15:0] data_i;
output reg [31:0] data_o;

always @(*)
begin
    data_o = {{16{data_i[15]}}, data_i};
end
          
endmodule      
     