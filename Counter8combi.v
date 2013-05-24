`include "coreCount8Add.v"
`include "coreCount8Sub.v"

module Counter8combi(iClk, _iIsAddOut, iCount, oCount);
parameter CountWidth = 8;

input iClk, _iIsAddOut;
input  [CountWidth-1:0] iCount;
output [CountWidth-1:0] oCount;

wire [CountWidth-1:0] out_Add, out_Sub;

assign oCount = (_iIsAddOut)? out_Add: out_Sub;
		//h. _updown indicates whether the counter 
		//   is counted upward (when high) or downward (when low).
coreCount8Add CA(iClk, _iIsAddOut, iCount, out_Add);
coreCount8Sub CS(iClk, _iIsAddOut, iCount, out_Sub);

endmodule
