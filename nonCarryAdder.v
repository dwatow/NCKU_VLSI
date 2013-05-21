module nonCarryAdder(sum, ab, a, b);
    input a, b;
     output ab, sum;
     
     wire aab, abb;
     
     nand ( ab, a, b );
     nand ( aab, a, ab );
     nand ( abb, ab, b );
     nand ( sum, aab, abb );
     
endmodule
