typedef enum  {d1,d2,d3,d4} digit_t;
module display(clk,clear,ones,tens,hundreds,thousands,slck,rlck,dio);
	input logic clk;
	input logic clear;
	input logic [3:0] ones;
	input logic [3:0] tens;
	input logic [3:0] hundreds;
	input logic [3:0] thousands;
	output logic slck;
	output logic rlck;
	output logic dio;
	
	parameter [7:0] one	 	= 8'b00000001;
	parameter [7:0] two 		= 8'b00000010;
	parameter [7:0] three 	= 8'b00000100;
	parameter [7:0] four		= 8'b00001000;
	
	
	digit_t digit, next_digit;
	
	always_ff@(posedge clk)
		begin
			if (clear)
				digit <= d0;
			else
				digit <= next_digit;
		end
		
	always_comb
		begin
			case  (state)
				d0: next_digit = d1;
				
				d1: next_digit = d2;
					 
				d2: next_digit = d3;
				
				d3: if(clear) next_digit = d0;
					 else next_digit = d3;
			endcase
		end	
		
	always_comb
		begin
			case (state)
				d0: begin
						dio = one[0];
						sclk = clk;
					end
			endcase
		end
endmodule