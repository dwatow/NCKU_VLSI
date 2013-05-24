module InitSel(oCountInitValue, _iReset, _iSet, _iLoad, iPreldVal, iCountValue);
parameter CountWidth = 8;

input _iReset, _iSet, _iLoad;
input [CountWidth-1:0] iCountValue, iPreldVal;
output [CountWidth-1:0] oCountInitValue;

reg [CountWidth-1:0] oCountInitValue;

	
//g. The priority of the control signal is _areset > _aset > _load. 
//   This is to avoid un-intentionally activate these three signals at the same time.
	always@(_iReset, _iSet, _iLoad, iCountValue, iPreldVal)
	begin
//e. _areset =1 makes the counter set to zero asynchronously, while 
//       _aset =1 let the counter set to its maximum value asynchronously. 
//   If none of them are high, the counter is operated regularly.
		if (_iReset == 1)
			oCountInitValue = 8'b1111_1111;
		else if (_iSet == 1)
		   oCountInitValue = 8'b0000_0000;
//f. If the signal load is active (high), 
//   the the preload value (preld-val) will be loaded, 
//   otherwise, no effect to the counter.
		else if (_iLoad == 1)
		   oCountInitValue = iPreldVal;
		else
		   oCountInitValue = iCountValue;
	end
	
endmodule
