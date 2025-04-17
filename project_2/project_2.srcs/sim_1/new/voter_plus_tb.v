`timescale 1ns / 10ps

module voter_plus_tb;
    reg A,B,C;
    wire F;
    
    voter_plus DUT(
    .A(A),
    .B(B),
    .C(C),
    .F(F)
    );
    
    initial begin
        A = 1'b0;
        B = 1'b0;
        C = 1'b0;
        
        #1 A=0;B=0;C=1;
		#1 A=0;B=1;C=0;
		#1 A=0;B=1;C=1;
		#1 A=1;B=0;C=0;
		#1 A=1;B=0;C=1;
		#1 A=1;B=1;C=0;
		#1 A=1;B=1;C=1;
		#1 A=0;B=0;C=0;
		#1 A=0;B=0;C=1;
		#1 A=0;B=1;C=0;
		#1 A=0;B=1;C=1;
		#1 A=1;B=0;C=0;
		#1 A=1;B=0;C=1;
		#1 A=1;B=1;C=0;
		#1 A=1;B=1;C=1;
		#1 A=0;B=0;C=0;
		#1 $stop;
	end	
endmodule