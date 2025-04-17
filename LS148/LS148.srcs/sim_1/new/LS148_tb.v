`timescale 1ns/100ps
module LS148_tb;
// Inputs
	reg EI,I0,I1,I2,I3,I4,I5,I6,I7;
// Outputs
	wire A0,A1,A2,E0,GS;
// Instantiate UUT
	LS148 DUT(
	.EI(EI),
	.I0(I0), 
    .I1(I1),
   .I2(I2),
   .I3(I3),
   .I4(I4),
   .I5(I5),
   .I6(I6),
   .I7(I7),
   	.A2(A2),		
    .A1(A1), 
    .A0(A0),
	.GS(GS),
	.E0(E0));		
	
	initial begin 
		EI=1;I0=0;I1=0; I2=0; I3=0;I4=0; I5=0;I6=0;I7=0;
		#10 EI=0;I0=0;I1=0; I2=0; I3=0;I4=0; I5=0;I6=0;I7=0;
		#10 EI=0;I0=0;I1=0; I2=0; I3=0;I4=0; I5=0;I6=0;I7=1;
		#10 EI=0;I0=0;I1=0; I2=0; I3=0;I4=0; I5=0;I6=1;I7=1;
		#10 EI=0;I0=0;I1=0; I2=0; I3=0;I4=0; I5=1;I6=1;I7=1;
		#10 EI=0;I0=0;I1=0; I2=0; I3=0;I4=1; I5=1;I6=1;I7=1;
		#10 EI=0;I0=0;I1=0; I2=0; I3=1;I4=1; I5=1;I6=1;I7=1;
		#10 EI=0;I0=0;I1=0; I2=1; I3=1;I4=1; I5=1;I6=1;I7=1;
		#10 EI=0;I0=0;I1=1; I2=1; I3=1;I4=1; I5=1;I6=1;I7=1;
		#10 $stop;
	end	
endmodule 