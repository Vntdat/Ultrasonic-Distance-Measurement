module adder(A,S,clk);
	input logic clk;
	input logic [15:0]A;
	output logic [15:0]S;
	
	always_ff@(posedge clk)
		S <= A + 1;
endmodule