// student ID: 113550021
// operate sll and srl

module Shifter(data_i, shamt, ctrl_i, data_o);

input [31:0] data_i;
input [4:0] shamt;
input [3:0] ctrl_i;
output reg [31:0] data_o;

always @(*) 
begin
    case(ctrl_i)
        4'b0110: // sll
        begin
            data_o <= data_i << shamt;
        end
        4'b0111: // srl
        begin
            data_o <= data_i >> shamt;
        end
    endcase
end
endmodule