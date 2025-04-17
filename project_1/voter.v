module voter (A, B, C, F);
	input A, B, C;
	output F;	
		nand (h1,A,B);
		nand (h2,B,C);
		nand (h3,A,C);
		nand (F, h1, h2, h3);
endmodule