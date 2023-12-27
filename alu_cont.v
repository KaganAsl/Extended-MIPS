module alu_cont(alu_op1, alu_op0, function_bits, out);
input alu_op1, alu_op0;
input [5:0] function_bits;
output reg [2:0] out;
always @(alu_op1 or alu_op0 or function_bits)
begin
	if(~(alu_op1 | alu_op0))
	out = 3'b010;
	if(alu_op0)
	out = 3'b110;
	if(alu_op1)
	begin
		if(function_bits[5] & ~(|function_bits[4:0]))
		out = 3'b010;
		if(function_bits[5] & ~(|function_bits[4:2]) & function_bits[1] & ~function_bits[0])
		out = 3'b110;
		if(function_bits[5] & ~(|function_bits[4:2]) & (&function_bits[1:0]))
		out = 3'b000;
		if((&function_bits[5:4]) & ~(|function_bits[3:1]) & function_bits[0])
		out = 3'b001;
		if((&function_bits[5:4]) & ~(|function_bits[3:0]))
		out = 3'b111;
		if(function_bits[5] & ~(|function_bits[4:1]) & function_bits[0])
		out = 3'b011;
	end
end
endmodule
