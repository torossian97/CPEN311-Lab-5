module domain_conv(input logic [4:0] data,
				   input logic fast_clk,
				   input logic slow_clk,
				   output logic [4:0] d_out);
				   
	logic [4:0] wire1, wire2, wireEn;
	logic enable;			
				
	always_ff @(posedge slow_clk) begin
		wire1 <= data;
	end

	always_ff @(posedge fast_clk) begin
		if(enable) begin
			wire2 <= wire1;
		end
	end

	always_ff @(posedge fast_clk) begin
		d_out <= wire2;
	end

	always_ff @(posedge ~fast_clk) begin
		wireEn <= slow_clk;
	end

	always_ff @(posedge ~fast_clk) begin
		enable <= wireEn;
	end

endmodule