`timescale 1ns/100ps

module top_plus_tb;

    // �����ź�
    reg [7:0] a, b;
    reg op;          // ������0-�ӷ���1-����
    reg en_n;        // �͵�ƽ��Ч

    // ����ź�
    wire [6:0] seg_tens, seg_ones;
    wire [7:0] S;
    wire cout;

    // BCD���
    wire [3:0] tens, ones; // ʮλ�͸�λBCD���
   
    // ʵ��������ģ��
    top uut (
        .A(a),
        .B(b),
        .op(op),
        .en_n(en_n),
        .S(S),
        .seg_tens(seg_tens),
        .seg_ones(seg_ones),
        .Cout(cout)
    );

    // ʵ���������Ƶ�BCDת��ģ��
    binary2bcd u_binary2bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );

    // ���Թ���
    initial begin
        $display("Time\tA\tB\tOP\tResult (seg)\tCOUT");

        en_n = 0;   // ����ģ��

        // �ӷ����ԣ�20 + 35 = 55
        a = 8'd20;
        b = 8'd35;
        op = 0;
        #10;
        $display("%4t\t%3d\t%3d\tADD\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // �������ԣ�100 - 45 = 55
        a = 8'd100;
        b = 8'd45;
        op = 1;
        #10;
        $display("%4t\t%3d\t%3d\tSUB\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // �������ԣ�40 - 100 = 196������������֣�
        a = 8'd40;
        b = 8'd100;
        op = 1;
        #10;
        $display("%4t\t%3d\t%3d\tSUB\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // �ӷ�������ԣ�200 + 100 = 300 -> ��ʾ 44����Ϊ8λ���255��
        a = 8'd200;
        b = 8'd100;
        op = 0;
        #10;
        $display("%4t\t%3d\t%3d\tADD\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        $stop;
    end

endmodule
