`include "mux2x1.v"
module mux_3b (f2,f1,f0,a0,b0,a1,b1,a2,b2, select,select_bar);
	input a0,b0,a1,b1,a2,b2;
	input select, select_bar;
	output f2,f1,f0;
	
	mux2x1 M0(f0,select, select_bar, a0,b0);
	mux2x1 M1(f1,select, select_bar, a1,b1);
	mux2x1 M2(f2,select, select_bar, a2,b2);
	
endmodule
