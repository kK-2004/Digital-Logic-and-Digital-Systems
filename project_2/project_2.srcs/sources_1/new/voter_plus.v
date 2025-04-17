module voter_plus(A,B,C,F);
    input A,B,C;
    output F;
        nand(h1,A,B);
        nand(h2,A,C);
        nand(F,h1,h2);
endmodule