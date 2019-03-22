module LFSR_module_tb();

    logic clk;
    logic reset = 1'b0;
	logic [4:0] lfsr;

    LFSR_module inst_1(.clk(clk),
						.reset(reset),
						.lfsr(lfsr));
    initial begin
        clk = 1'b0;
    end


    task clk_cycle();
        #5 clk = ~clk; #5 clk = ~clk;
    endtask

    initial begin
	clk_cycle();
	reset = 1'b1;
	clk_cycle();
	reset = 1'b0;
        repeat (30) begin
			clk_cycle();
		end
    end


endmodule