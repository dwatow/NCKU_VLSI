`include "counter8uni2.v"

module counter16unit (clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);
parameter countWidth = 8;

	input        clk, 
					_areset,
					_aset,
					_load,
					_updown, 
					_wrapstop;
	input [countWidth-1:0]  preld_val;

	output [countWidth-1:0] dcout;
	output overflow;

	wire [countWidth-1:0] tCount_M12, tCountM23;

	
	counter8uni2 hCount(clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);
	counter8uni2 lCount(clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);
endmodule
