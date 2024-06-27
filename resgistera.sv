	module tff (clear,clk,Q);

	input	 	logic 	clear;
	input 	logic 	clk;
	output 	logic		[13:0]Q;

	always_ff@(negedge clk)
		begin
			if (clear)
				Q <=  0;
			else				
				Q <= !Q;
		end
		
endmodule