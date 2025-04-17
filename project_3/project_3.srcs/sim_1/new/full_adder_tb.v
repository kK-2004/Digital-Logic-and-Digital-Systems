`timescale 1ns / 100ps

module full_adder_tb;

    reg A;     
    reg B;     
    reg C;    
    reg en_n;  // ����Чʹ�ܶ�
    
    wire S;    
    wire Cout; // ��λ���

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
        en_n = 1;  // ��ʼʹ����Ч
        
        // ����ʹ�ܹ���
        #10 en_n = 0;  // ʹ����Ч
        
        // �������п��ܵ��������
        #10 A=0; B=0; C=0;
        #10 A=0; B=0; C=1;
        #10 A=0; B=1; C=0;
        #10 A=0; B=1; C=1;
        #10 A=1; B=0; C=0;
        #10 A=1; B=0; C=1;
        #10 A=1; B=1; C=0;
        #10 A=1; B=1; C=1;
        
        // �ٴβ���ʹ����Ч�����
        #10 en_n = 1;
        #10 A=1; B=1; C=1;  // ���ӦΪ0
        
        // ��������
        #10 $finish;
    end
    
endmodule