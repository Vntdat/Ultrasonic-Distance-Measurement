module  bin2bcd(clk,clear,I,bcd0,bcd1,bcd2);
	input logic clk;
	input logic clear;
	input logic [7:0]I;
	output logic [3:0]bcd0;
	output logic [3:0]bcd1;
	output logic [3:0]bcd2;

integer i;
logic [9:0] scratch;
logic [19:0] combined;

always_ff@(posedge clk)
begin
		scratch = 0;
		combined = {scratch[9:0], I[7:0]};
for (i=0; i<8; i=i+1) 
	begin 
        
		if (combined[11:8] > 4) 
			combined[11:8] = combined[11:8] + 4'b0011;
		if (combined[15:12] > 4)	
			combined[15:12] = combined[15:12] + 4'b0011;
		if (combined[19:16] > 4)
			combined[19:16] = combined[19:16] + 4'b0011;

		combined = combined<<1;
	end
	
	bcd2 = combined[19:16];
	bcd1 = combined[15:12];
	bcd0 = combined[11:8];
end
endmodule