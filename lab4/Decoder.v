// ID: 113550021
module Decoder( 
	instr_op_i, 
	ALUOp_o, 
	ALUSrc_o,
	RegWrite_o,	
	RegDst_o,
	Branch_o,
	MemRead_o, 
	MemWrite_o, 
	MemtoReg_o
);
     
// TO DO
input [5:0] instr_op_i;

output reg [1:0] ALUOp_o;
output reg ALUSrc_o, RegWrite_o, RegDst_o, Branch_o, MemRead_o, MemWrite_o, MemtoReg_o;

always@(*)begin
	case (instr_op_i)
		6'b000000: // R 
		begin 
			ALUOp_o 	<= 2'b00;
			ALUSrc_o 	<= 1'b0;
			RegDst_o 	<= 1'b1;
			RegWrite_o 	<= 1'b1;
			Branch_o 	<= 1'b0;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b0;
			MemtoReg_o 	<= 1'b0;
		end
		6'b001001: // addi
		begin 
			ALUOp_o 	<= 2'b01;
			ALUSrc_o 	<= 1'b1;
			RegDst_o 	<= 1'b0;
			RegWrite_o 	<= 1'b1;
			Branch_o 	<= 1'b0;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b0;
			MemtoReg_o 	<= 1'b0;
		end
		6'b101100: // lw 
		begin 
			ALUOp_o 	<= 2'b01;
			ALUSrc_o 	<= 1'b1;
			RegDst_o 	<= 1'b0;
			RegWrite_o 	<= 1'b1;
			Branch_o 	<= 1'b0;
			MemRead_o 	<= 1'b1;
			MemWrite_o 	<= 1'b0;
			MemtoReg_o 	<= 1'b1;
		end
		6'b100100: // sw 
		begin 
			ALUOp_o 	<= 2'b01;
			ALUSrc_o 	<= 1'b1;
			// RegDst_o don't care
			RegWrite_o 	<= 1'b0;
			Branch_o 	<= 1'b0;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b1;
			// MemtoReg_o don't care
		end
		6'b000110: // beq 
		begin
			ALUOp_o 	<= 2'b10;
			ALUSrc_o 	<= 1'b0;
			// RegDst_o don't care
			RegWrite_o 	<= 1'b0;
			Branch_o 	<= 1'b1;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b0;
			// MemtoReg_o don't care
		end
		6'b000101: // bne 
		begin
			ALUOp_o 	<= 2'b11;
			ALUSrc_o 	<= 1'b0;
			// RegDst_o don't care
			RegWrite_o 	<= 1'b0;
			Branch_o 	<= 1'b1;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b0;
			// MemtoReg_o don't care
		end
		default:  
		begin
			ALUOp_o 	<= 2'b00;
			ALUSrc_o 	<= 1'b0;
			RegDst_o 	<= 1'b0;
			RegWrite_o 	<= 1'b0;
			Branch_o 	<= 1'b0;
			MemRead_o 	<= 1'b0;
			MemWrite_o 	<= 1'b0;
			MemtoReg_o 	<= 1'b0;
		end
	endcase
end
endmodule