module CircleStop(oCount, iClk, iCount, _iWrapstop, oOverflow);
parameter countWidth = 8;

input _iWrapstop, iClk;
input [countWidth-1:0] iCount;
output oOverflow;
output [countWidth-1:0] oCount;

reg [countWidth-1:0] oCount;
reg oOverflow;

always@(posedge iClk)
begin
   if ((_iWrapstop == 1) && ((oCount == 8'b0000_0000)))
	begin
		oCount    <= 8'b0000_0000;
		oOverflow <= 'b1;
	end
	else if ((_iWrapstop == 1) && (oCount == 8'b1111_1111))
	begin
		oCount    <= 8'b1111_1111;
		oOverflow <= 'b1;
	end
	else
	begin
		oCount    <= iCount;
		oOverflow <= 'b0;
	end
end

endmodule
