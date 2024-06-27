	typedef enum  {s0,s1,s2,s3,s4} state_t;
module FSM (clk,clear,load,B,trigger,echo,rst);
				input 	logic clk;
				input 	logic B;
				input 	logic echo;
				input 	logic rst;
				output 	logic clear;
				output 	logic trigger;
				output 	logic load;

	state_t state, next_state;
	
	always_ff@(posedge clk)
		begin
			if (rst)
				state <= s0;
			else
				state <= next_state;
		end
	
	always_comb
		begin
			case  (state)
				s0: if (B) next_state = s1;
					 else	next_state = s0;
				
				s1: next_state = s2;
					 
				s2: if (echo) next_state = s3;
					 else next_state = s2;
				
				s3: next_state = s4;
				
				s4: if (rst) next_state = s0;
					 else next_state = s4;
			endcase
		end
	
	always_comb
		begin
			case (state)
				s0: begin
					clear = 1'b1;
					trigger = 1'b0;
					load = 1'b0;
					end
				
				s1: begin
					clear = 1'b0;
					trigger = 1'b1;
					load =1'b0;
					end
				
				s2: begin
					clear = 1'b0;
					trigger = 1'b0;
					load = 1'b0;
					end
				
				s3:  begin
					clear = 1'b0;
					trigger = 1'b0;
					load  = 1'b1;
					end
					
				s4: begin
					clear = 1'b0;
					trigger = 1'b0;
					load = 1'b0;
					end
			endcase
	end

endmodule