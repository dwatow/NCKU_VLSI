module mux2x1(f, s, s_bar, a, b);
    output f;
    input s, s_bar;
    input a, b;

    wire nand1_out, nand2_out;
    // boolean function
    nand(nand1_out, s_bar, a);
    nand(nand2_out, s, b);
    nand(f, nand1_out, nand2_out); 
endmodule
