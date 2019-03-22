module LFSR_module (input logic clk,
					input logic reset,
					output logic [4:0] lfsr);
					
logic xor_gate;

vDFF inst_1 (.data(lfsr[4]),.clk(clk),.reset(reset),.q(lfsr[3]));
vDFF inst_2 (.data(lfsr[3]),.clk(clk),.reset(reset),.q(lfsr[2]));
vDFF inst_4 (.data(lfsr[1]),.clk(clk),.reset(reset),.q(lfsr[0]));
assign xor_gate = lfsr[0] ^ lfsr[2];
vDFF inst_5 (.data(xor_gate),.clk(clk),.reset(reset),.q(lfsr[4]));

// LFSR SPECIAL - Reset is changed		
always_ff @(posedge clk)
 if (reset) begin
	lfsr[1] <= 1'b1;
 end
 else begin
	lfsr[1] <= lfsr[2];
 end

endmodule