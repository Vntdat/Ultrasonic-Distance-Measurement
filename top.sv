module top(clk,B,trigger,echo,rst,bcd0,bcd1,bcd2);
	input logic	clk;
	input logic	B;
	input	logic	echo;
	input logic	rst;
	output logic trigger;
	output logic [3:0]bcd0;
	output logic [3:0]bcd1;
	output logic [3:0]bcd2;
	

	logic	clear;
	logic load;
	logic [8:0]count;
	logic [7:0]distance;
	logic [7:0]binary;
	counter count_reg 		(.clk(clk),
									.clear(clear),
									.Q(count));
									
	shift div2					(.clk(clk),
									.I(count),
									.Q(distance));

	total total					(.clk(clk),
									.load(load),
									.clear(clear),
									.I(distance),
									.Q(binary));
		
	bin2bcd bcd					(.clk(clk),
									.clear(clear),
									.I(binary),
									.bcd0(bcd0),
									.bcd1(bcd1),
									.bcd2(bcd2));

									
	FSM	fsm					(.clk(clk),
									.clear(clear),
									.rst(rst),
									.load(load),
									.B(B),
									.echo(echo),
									.trigger(trigger));
									
endmodule