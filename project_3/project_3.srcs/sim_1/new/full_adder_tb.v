`timescale 1ns / 100ps

module full_adder_tb;

    reg A;     
    reg B;     
    reg C;    
    reg en_n;  // 低有效使能端
    
    wire S;    
    wire Cout; // 进位输出

    full_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .en_n(en_n),
        .S(S),
        .Cout(Cout)
    );
    
    initial begin
        
        A = 0;
        B = 0;
        C = 0;
        en_n = 1;  // 初始使能无效
        
        // 测试使能功能
        #10 en_n = 0;  // 使能有效
        
        // 测试所有可能的输入组合
        #10 A=0; B=0; C=0;
        #10 A=0; B=0; C=1;
        #10 A=0; B=1; C=0;
        #10 A=0; B=1; C=1;
        #10 A=1; B=0; C=0;
        #10 A=1; B=0; C=1;
        #10 A=1; B=1; C=0;
        #10 A=1; B=1; C=1;
        
        // 再次测试使能无效的情况
        #10 en_n = 1;
        #10 A=1; B=1; C=1;  // 输出应为0
        
        // 结束仿真
        #10 $finish;
    end
    
endmodule