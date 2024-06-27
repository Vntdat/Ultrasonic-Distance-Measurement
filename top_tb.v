`timescale 1us/1us

module	top_tb;
	reg	clk;
	reg	B;
	reg	echo;
	reg   rst;
	wire	trigger;
	wire [3:0] bcd0;    
	wire [3:0] bcd1;
	wire [3:0] bcd2;
	
	top	DUT(.clk(clk),
				.B(B),
				.echo(echo),
				.trigger(trigger),
				.bcd0(bcd0),
				.bcd1(bcd1),
				.bcd2(bcd2),
				.rst(rst));
				
	initial begin
		clk=0;
		B=0;
		echo=0;
		#20 rst=1;
		#40 rst=0;
		#50 B=1;
		#100 B=0;
		#800 echo=1;
		#100 echo=0;
		#1000 rst=1;
		#100 rst=0;
	end
	
	always begin
		#33 clk = !clk;
	end

	endmodule
	