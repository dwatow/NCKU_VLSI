module counter8uni(clk, _areset, _aset, _load, preld_val, _updown, _wrapstop, dcout, overflow);

	input        clk, 
					_areset,
					_aset,
					_load,
					_updown, 
					_wrapstop;
	input [7:0]  preld_val;

	output [7:0] dcout,
					 overflow;

	always@(posedge clk)
	begin
		//something
	end

endmodule


//e. _areset =1 makes the counter set to zero asynchronously, while _aset =1 let the counter set to its maximum value asynchronously. 
//   If none of them are high, the counter is operated regularly.
//f. If the signal load is active (high), the the preload value (preld-val) will be loaded, otherwise, no effect to the counter.
//g. The priority of the control signal is _areset > _aset > _load. This is to avoid un-intentionally activate these three signals at the same time.
//h. _updown indicates whether the counter is counted upward (when high) or downward (when low).
//i. _wrapstop is used to set the counting behavior. If _wrapstop = 1, the counter will wrap around. (Ex. If the counting is upward , the counter will go back to zero and then recount again.) If _wrapstop = 0, the counter will stop and issue overflow.
//j. If the result is out of range, overflow will be flagged to logic 1, otherwise, 0.
//k. You may add other signal additional pins and function as long as you clearly specify and explain.
//l. Hierarchy design is allowed; however, they must be specified.
//m. The design shall be implemented by using structural style and be able to identified major components.
