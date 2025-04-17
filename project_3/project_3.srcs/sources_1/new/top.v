module top(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input en_n,
    output [6:0] seg_tens,  // ʮλ�����
    output [6:0] seg_ones,  // ��λ�����
    output [7:0] S,
    output dp_ones,              // С����
    output dp_tens,              // С����
    output Cout
);
    wire [3:0] tens, ones;
    
    // ʵ����8λ�ӷ���
    adder8 u_adder(
        .A(A),
        .B(B),
        .Cin(Cin),
        .en_n(en_n),
        .S(S),
        .Cout(Cout)
    );
    
    // ʵ���������Ƶ�BCDת����
    binary2bcd u_bcd(
        .binary(S),
        .tens(tens),
        .ones(ones)
    );
    
    // ʵ����ʮλ����ܽ�����
    dpy u_tens_decoder(
        .bcd(tens),
        .seg(seg_tens)
    );
    
    // ʵ������λ����ܽ�����
    dpy u_ones_decoder(
        .bcd(ones),
        .seg(seg_ones)
    );
    
    // �ر�С����
    assign dp_tens = 1'b0;
    assign dp_ones = 1'b0;
endmodule