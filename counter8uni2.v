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
	
	reg [countWidth-1:0] dcout;
	reg [countWidth-1:0] counter;
	reg overflow;

	//e. _areset =1 makes the counter set to zero asynchronously, while 
	//       _aset =1 let the counter set to its maximum value asynchronously. 
	//   If none of them are high, the counter is operated regularly.
//	always@(_areset, _aset, dcout)
//	begin
//		if (_areset == 1)
//			dcout = 8'b1111_1111;
//		else if (_aset == 1)
//		   dcout = 8'b0000_0000;
//		else
//		   dcout = counter;
//	end

	always@(posedge clk, negedge _load, negedge _updown)
	begin
	//f. If the signal load is active (high), 
	//   the the preload value (preld-val) will be loaded, 
	//   otherwise, no effect to the counter.
	   if (!_load)
		   counter <= preld_val;
		else
		begin
		//h. _updown indicates whether the counter 
		//   is counted upward (when high) or downward (when low).
			if (!_updown)
				counter <= counter - 1;
			else
				counter <= counter + 1;
		end
	end
	
endmodule