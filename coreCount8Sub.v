//module coreCount8Sub(iClk, _iRst, _iEn, iCount, oCount);
module coreCount8Sub(iClk, _iEn, iCount, oCount);
parameter CountWidth = 8;

input iClk, _iEn;//, _iRst
input  [CountWidth-1:0] iCount;
output [CountWidth-1:0] oCount;

reg [CountWidth-1:0] oCount;

always@(posedge iClk)//, negedge _iRst)
begin
//   if (!_iRst)
//	   oCount <= 8'd0;
//	else
	if (!_iEn)
	   oCount <= iCount - 8'd1;
	else
		oCount <= iCount;
end

endmodule

