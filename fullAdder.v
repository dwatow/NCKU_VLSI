`include "nonCarryAdder.v"

module fullAdder( sum, c_out, c_in, a, b );
    input a, b, c_in;
	 output sum, c_out;
	 
	 wire sumM1, abM1, aM1, bM1;
	 wire sumM2, abM2, aM2, bM2;
	 
	 //set Input of M1 & System
	 assign aM1 = a;
	 assign bM1 = b;
	 
	 //set Output of M2
	 assign aM2 = sumM1;
	 assign bM2 = c_in;
	 
	 //set Output of System
	 assign sum = sumM2;
	 nand (c_out, abM1, abM2);
	 
    nonCarryAdder M1(sumM1, abM1, aM1, bM1);
    nonCarryAdder M2(sumM2, abM2, aM2, bM2);

endmodule
