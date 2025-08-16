// ID
module Hazard_Detection(
    memread,
    instr_i,
    idex_regt,
    branch,
    pcwrite,
    ifid_write,
    ifid_flush,
    idex_flush,
    exmem_flush
);

// TO DO
input memread, branch;
input [31:0] instr_i;
input [4:0] idex_regt;
output pcwrite, ifid_write, ifid_flush, idex_flush, exmem_flush;
reg pcwrite, ifid_write, ifid_flush;
reg idex_flush, exmem_flush;

wire [4:0] if_rs = instr_i[25:21];
wire [4:0] if_rt = instr_i[20:16];

always @(*) begin
    pcwrite = 1;
    ifid_write = 1;
    ifid_flush = 0;
    idex_flush = 0;
    exmem_flush = 0;
    
    if (memread && (idex_regt != 0) &&  ((idex_regt == if_rs) || (idex_regt == if_rt))) begin
        pcwrite = 0;       
        ifid_write = 0; 
        idex_flush = 1;  
    end
    if (branch) begin
        ifid_flush = 1;   
        idex_flush = 1;     
        exmem_flush = 1;    
    end
end

endmodule