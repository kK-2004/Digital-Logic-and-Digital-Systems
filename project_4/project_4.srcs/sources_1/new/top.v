module top(
    input [7:0] A,
    input [7:0] B,
    input op,           // 0: �ӷ���1: ����
    input en_n,         // ����Чʹ���ź�
    output [7:0] S,
    output [6:0] seg_tens,  // ʮλ��������
    output [6:0] seg_ones,  // ��λ��������
    output Cout          // ��λ/��λ���
);

    wire [3:0] tens, ones;

    // ʵ����8λ�Ӽ������������sync_adder4��
    adder8_sync u_arith (
        .a(A),
        .b(B),
        .op(op),
        .en_n(en_n),
        .sum(S),
        .cout(Cout)
    );

    // ������תBCD
    binary2bcd u_bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );

    // �������ʾ��ʮλ��
    dpy u_dpy_tens (
        .bcd(tens),
        .seg(seg_tens)
    );

    // �������ʾ����λ��
    dpy u_dpy_ones (
        .bcd(ones),
        .seg(seg_ones)
    );

endmodule