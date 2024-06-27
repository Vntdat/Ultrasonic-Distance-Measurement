module counter(clear,clk,Q);
	input logic clear;
	input logic clk;
	output [8:0]Q;
	
	tf tf1(.Q(Q[0]),
			  .clk(clk),
			  .clear(clear));
	
	tf tf2(.Q(Q[1]),
			  .clk(Q[0]),
			  .clear(clear));
			  
	tf tf3(.Q(Q[2]),
			  .clk(Q[1]),
			  .clear(clear));
			  
	tf tf4(.Q(Q[3]),
			  .clk(Q[2]),
			  .clear(clear));
			  
	tf tf5(.Q(Q[4]),
			  .clk(Q[3]),
			  .clear(clear));
		  
	tf tf6(.Q(Q[5]),
			  .clk(Q[4]),
			  .clear(clear));			 
			  
	tf tf7(.Q(Q[6]),
			  .clk(Q[5]),
			  .clear(clear));

	tf tf8(.Q(Q[7]),
			  .clk(Q[6]),
			  .clear(clear));
			  
	tf tf9(.Q(Q[8]),
			  .clk(Q[7]),
			  .clear(clear));
			  
endmodule