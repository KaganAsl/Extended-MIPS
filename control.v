module control(in, reg_dest, jump, branch_eq, branch_not_eq, mem_read, mem_to_reg,
alu_op1, alu_op0, mem_write, alu_src, reg_write);

input [7:0] in;

output reg_dest, jump, branch_eq, branch_not_eq, mem_read, mem_to_reg,
alu_op1, alu_op0, mem_write, alu_src, reg_write;

wire r_format, lw, sw, addi, beq, bne, j;

assign r_format = in[5] & (~in[4]) & in[3] & in[2] & (~in[1]) & in[0];
assign lw = in[5] & (~in[4]) & in[3] & in[2] & in[1] & (~in[0]);
assign sw = in[5] & (~in[4]) & in[3] & in[2] & in[1] & in[0];
assign j = in[5] & in[4] & (~in[3]) & (~in[2]) & (~in[1]) & (~in[0]);
assign beq = in[5] & in[4] & (~in[3]) & (~in[2]) & (~in[1]) & in[0];
assign bne = in[5] & in[4] & (~in[3]) & (~in[2]) & in[1] & (~in[0]);
assign addi = in[5] & in[4] & (~in[3]) & (~in[2]) & in[1] & in[0];

assign reg_dest = r_format;
assign jump = j;
assign branch_eq = beq;
assign branch_not_eq = bne;
assign mem_read = lw;
assign mem_to_reg = lw | addi;
assign alu_op1 = r_format;
assign alu_op0 = beq | bne;
assign mem_write = sw;
assign alu_src = lw | sw | addi;
assign reg_write = r_format | lw | addi;

endmodule
