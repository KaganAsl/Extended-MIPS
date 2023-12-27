module pc_sign_extend(in, out);
input [23:0] in;
output [31:0] out;
wire bit = 0;
assign out = {{8 {bit}}, in};
endmodule
