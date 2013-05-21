module halfAdder(sum, c_out, a, b);
    input a, b;
	 output c_out, sum;

//General
//	and ( c_out, a, b );
//	xor ( sum , a, b );
	 
//All nand
	 wire ab, aab, abb;
	 
	 nand ( ab, a, b );
	 nand ( aab, a, ab );
	 nand ( abb, ab, b );
	 nand ( c_out, ab, ab );
	 nand ( sum, aab, abb );
	 
endmodule
