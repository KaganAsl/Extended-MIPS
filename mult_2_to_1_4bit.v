module mult2_to_1_4bit(i0, i1, s, out); // S -> select
input [3:0] i0, i1;
input s;
output [3:0] out;
assign out = s ? i1:i0;
endmodule
