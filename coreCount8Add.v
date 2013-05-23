module coreCount8Add(iClk, _iRst, iEn, iCount, oCount);
parameter CountWidth = 8;

input iClk, _iRst, iEn;
input  [CountWidth-1:0] iCount;
output [CountWidth-1:0] oCount;

reg [CountWidth-1:0] oCount;

always@(posedge iClk, negedge _iRst)
begin
   if (!_iRst)
	   oCount <= 8'd0;
	else
	if (iEn)
	   oCount <= iCount + 8'd1;
	else
		oCount <= iCount;
end

endmodule

