`include "InitSel.v"
`include "Counter8combi.v"
`include "CircleStop.v"

module counter8uni2(clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);
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

	
	InitSel       M1( .oCountInitValue(tCount_M12), ._iReset(_areset), ._iSet(_aset), ._iLoad(_load), .iPreldVal(preld_val), .iCountValue(dcout) );
	Counter8combi M2( .oCount(tCountM23), .iClk(clk), ._iIsAddOut(_updown), .iCount(tCount_M12) );
	CircleStop    M3( .oCount(dcout), .iClk(clk), .iCount(tCountM23), ._iWrapstop(_wrapstop), .oOverflow(overflow) );
endmodule
