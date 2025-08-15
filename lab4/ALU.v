// ID: 113550021
module ALU(
	src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o,
	overflow,
	cout
	);
     
input  [31:0]  src1_i, src2_i;
input  [3:0]   ctrl_i;

output reg [31:0] result_o;
output reg zero_o, overflow, cout;

reg [32:0] add_result, sub_result;

always @(*) 
begin
    result_o = 0;
    zero_o   = 0;
    cout     = 0;
    overflow = 0;

    add_result = {1'b0, src1_i} + {1'b0, src2_i};
    sub_result = {1'b0, src1_i} - {1'b0, src2_i};

    case (ctrl_i)
        4'b0000: // add
		begin
            result_o = src1_i + src2_i;
            cout     = add_result[32];
            overflow = ~(src1_i[31] ^ src2_i[31]) & (src1_i[31] ^ result_o[31]);
        end
        4'b0001: // sub
		begin
            result_o = src1_i - src2_i;
            cout     = sub_result[32];
            overflow = (src1_i[31] ^ src2_i[31]) & (src1_i[31] ^ result_o[31]);
        end
        4'b0010: result_o = src1_i & src2_i; // and
        4'b0011: result_o = src1_i | src2_i; // or
        4'b0100: result_o = ~(src1_i | src2_i); // nor
        4'b0101: result_o = (src1_i < src2_i) ? 1 : 0; // slt
        default: result_o = 0;
    endcase

    zero_o = (result_o == 0);
end

endmodule