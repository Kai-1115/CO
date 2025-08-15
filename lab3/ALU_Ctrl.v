// student ID: 113550021
module ALU_Ctrl(
        funct_i,
        ALUOp_i,
        ALUCtrl_o,
        shift_content // 0 is reg, 1 is shamt
        );
          
// I/O ports 
input      [6-1:0] funct_i;
input      [2-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;  
output reg shift_content;
// Internal Signals
reg [3:0] ALUCtrl_o;

// Main function
always @(*) begin
    ALUCtrl_o = 4'b1111;
    shift_content = 1'b0;

    case(ALUOp_i)
        2'b10: // R 
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
                6'b000010: // sll 
                    begin 
                        ALUCtrl_o = 4'b0110; 
                        shift_content = 1'b1; 
                    end
                6'b000100: // srl 
                    begin 
                        ALUCtrl_o = 4'b0111; 
                        shift_content = 1'b1; 
                    end
                6'b000110: // sllv 
                    begin 
                        ALUCtrl_o = 4'b1000; 
                        shift_content = 1'b0; 
                    end
                6'b001000: // srlv 
                    begin 
                        ALUCtrl_o = 4'b1001; 
                        shift_content = 1'b0; 
                    end
                6'b001100: // jr 
                    ALUCtrl_o = 4'b1010;
            endcase
        end
        2'b00: // lw, sw, addi => add
            ALUCtrl_o = 4'b0000;
        2'b01: // beq, bne => sub 
            ALUCtrl_o = 4'b0001;
    endcase
end  
endmodule
