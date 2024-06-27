module shift(Q,I,clk);
	input  logic clk;
	input  logic [8:0]I;
	output logic [7:0]Q;
	
	always_ff@(negedge clk)
				Q <= I>>1;
		
endmodule