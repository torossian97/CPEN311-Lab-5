module domain_conv_tb();

    logic clk, qclk;
    logic reset = 1'b0;
	logic [4:0] lfsr, d_out;

    LFSR_module inst_1(.clk(clk),
					   .reset(reset),
					   .lfsr(lfsr));
						
	domain_conv inst_2(.data(lfsr),
					   .fast_clk(qclk),
					   .slow_clk(clk),
					   .d_out(d_out));
	
	
    initial begin
        clk = 1'b0;
        qclk = 1'b0;
    end

	task quick_cycle();
        #5 qclk = ~qclk; #5 qclk = ~qclk;
    endtask
	
    task clk_cycle();
        #10 clk = ~clk; #10 clk = ~clk;
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
	
	initial begin
        repeat (60) begin
			quick_cycle();
		end
    end


endmodule