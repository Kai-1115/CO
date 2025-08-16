// ID: 113550021
module ALU_Ctrl(
    funct_i,
    ALUOp_i,
    ALUCtrl_o
);
          
// TO DO
input [5:0] funct_i;
input [1:0] ALUOp_i;
output reg [3:0] ALUCtrl_o;

always @(*) 
begin
    ALUCtrl_o = 4'b1111;
    case(ALUOp_i)
        2'b00: // R 
        begin
            case (funct_i)
                6'b100011: // add 
                    ALUCtrl_o = 4'b0000;
                6'b100001: // sub 
                    ALUCtrl_o = 4'b0001;
                6'b100110: // and 
                    ALUCtrl_o = 4'b0010;
                6'b100101: // or 
                    ALUCtrl_o = 4'b0011;
                6'b101011: // nor 
                    ALUCtrl_o = 4'b0100;
                6'b101000: // slt 
                    ALUCtrl_o = 4'b0101;
            endcase
        end
        2'b01: // lw, sw, addi => add
            ALUCtrl_o = 4'b0000;
        2'b10: // beq => sub
            ALUCtrl_o = 4'b0001;
        2'b11: // bne => sub
            ALUCtrl_o = 4'b0001;
    endcase
end

endmodule
