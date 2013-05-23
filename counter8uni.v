module counter8uni(clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);
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
	wire _continueCount;
	
	assign _continueCount = _areset & _aset;
	
	always@(_areset, _aset, continueCount)
	begin
		if (_areset & _continueCount)
			dcout = 8'b1111_1111;
		else if (_aset & _continueCount)
		   dcout = 8'b0000_0000;
		else
		   dcout = counter;
	end

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
			if (!_wrapstop)
			//i. _wrapstop is used to set the counting behavior. 
			//   If _wrapstop = 1, the counter will wrap around. (Ex. If the counting is upward , the counter will go back to zero and then recount again.) 
			//   If _wrapstop = 0, the counter will stop and issue overflow.
				if (counter == 8'b1111_1111)
				begin
					counter <= 8'b1111_1111;
					overflow <= 1;
				end
				else
				begin
					counter <= counter + 1;
					overflow <= 0;
				end
			else
				counter <= counter + 1;
		end
	end
	
endmodule

//g. The priority of the control signal is _areset > _aset > _load. This is to avoid un-intentionally activate these three signals at the same time.


//k. You may add other signal additional pins and function as long as you clearly specify and explain.
//l. Hierarchy design is allowed; however, they must be specified.
//m. The design shall be implemented by using structural style and be able to identified major components.
