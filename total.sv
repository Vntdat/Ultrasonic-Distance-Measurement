module total(clear,load,clk,I,Q);
	input 	logic 	clear;
	input 	logic 	load;
	input 	logic 	clk;
	input 	logic 	[7:0]I;
	output 	logic		[7:0]Q;
		
	always_ff@(posedge clk)
		begin
			if (clear)
				Q <= 0;
			else if (load)
				Q <= I;
		end
		
endmodule
