module mod_select(input logic [3:0] modulation_selector,
					input [7:0] signal_select,
					input [11:0] sin,
					input [11:0] cos,
					input [11:0] saw,
					input [11:0] square,
					input en,
					output [11:0] signal_mod,
					output [11:0] signal);

	always_ff @(*) begin
		casex(modulation_selector)
			4'bxx00: signal_mod <= en ? signal : 12'b0; //ASK_out
			4'bxx01: signal_mod <= 21'b0;
			4'bxx10: signal_mod <= en ? signal : {~signal+1} // BPSK_out
			4'bxx11: signal_mod <= en ? 12'b0 : 12'b1000_0000_0000;
			//default:		mod_wave <= sin_out & {12{LFSRS[0]}}; //ASK_out
		endcase
		
		case(signal_select)
			8'bxxxxxx00:		signal <= sin;
			8'bxxxxxx01:		signal <= cos;	
			8'bxxxxxx10:		signal <= saw;	
			8'bxxxxxx11:		signal <= square;	
			//default: 	sig <= 11'b0;
		endcase
	end

endmodule