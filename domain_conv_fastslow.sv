module boost_conv_fast_slow (input logic fastclk,
							 input logic slowclk,
							 input logic [11:0] data,
							 output logic [11:0] d_out
							 );

	logic bottomwire, en;
	logic [11:0] reg1, reg2;

	always_ff @(posedge fastclk) begin
		reg1 <= data;
	 end

	always_ff @(posedge fastclk) begin
		if (en) begin
			reg2 <= reg1;
		end
	end
	 
	always_ff @(posedge slowclk) begin
		d_out <= reg2;
	 end
	 
	always_ff @(posedge ~fastclk) begin
		bottom <= slowclk;
	end

	always_ff @(posedge ~fastclk) begin
		en <= slowclk;
	end

				 
endmodule