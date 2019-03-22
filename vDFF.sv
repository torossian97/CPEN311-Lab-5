module vDFF(
input logic data,
input logic clk,
input logic reset,
output logic q
);

always_ff @(posedge clk)
 if (reset) begin
	q <= 1'b0;
 end
 else begin
	q <= data;
 end
 
endmodule