`timescale 1ns / 100ps
module top_tb;
    // �����ź�
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    reg en_n;
    
    // ����ź�
    wire [6:0] seg_tens;  // ʮλ�����
    wire [6:0] seg_ones;  // ��λ�����
    wire [7:0] S;
    wire dp_ones;         // С����
    wire dp_tens;         // С����
    wire Cout;
    
    // BCD���
    wire [3:0] tens, ones; // ʮλ�͸�λBCD���

    // ʵ��������ģ��
    top u_top (
        .A(A),
        .B(B),
        .Cin(Cin),
        .en_n(en_n),
        .seg_tens(seg_tens),
        .seg_ones(seg_ones),
        .S(S),
        .dp_ones(dp_ones),
        .dp_tens(dp_tens),
        .Cout(Cout)
    );
    
    // ʵ���������Ƶ�BCDת��ģ��
    binary2bcd u_binary2bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );
    
    // ��ʼ���ź�
    initial begin
        // ���ó�ʼֵ
        A = 8'd0;
        B = 8'd0;
        Cin = 1'b0;
        en_n = 1'b1;
        
        // �ȴ�һ��ʱ�����ȶ�
        #10;
        
        // ���Բ�ͬ����
        A = 8'd1; B = 8'd0; Cin = 1'b0; en_n = 1'b0;  // 1 + 0 = 1
        #10;
        
        A = 8'd15; B = 8'd10; Cin = 1'b0; en_n = 1'b0;  // 15 + 10 = 25
        #10;
       
        // ��ɲ���
        $stop;
    end
    
    // ��ʾ���
    initial begin
        $monitor("At time %t: A = %d, B = %d, Cin = %b, en_n = %b, S = %d, Cout = %b, seg_tens = %b, seg_ones = %b, tens = %d, ones = %d",
                 $time, A, B, Cin, en_n, S, Cout, seg_tens, seg_ones, tens, ones);
    end
endmodule
