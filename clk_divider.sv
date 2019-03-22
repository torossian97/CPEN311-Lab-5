module clk_divider
(input logic inclk, 
 input logic [31:0] div_clk_count,
 input logic Reset,
 output logic outclk);
 
	logic [31:0] counter_current;
	logic [31:0] counter_next;
	logic clk_temp;

	always_ff @(posedge inclk, posedge Reset)
	 begin
		if (Reset)
			begin
				counter_current <= 0;
				clk_temp <= 1'b0;
			end
 
		else if (counter_next >= div_clk_count)
			begin
				counter_current <= 0;
				clk_temp <= ~clk_temp;
			end
 
		else 
			counter_current <= counter_next;
	 end
 
	assign counter_next = counter_current+1;   	      
	assign outclk = clk_temp;
	
endmodule