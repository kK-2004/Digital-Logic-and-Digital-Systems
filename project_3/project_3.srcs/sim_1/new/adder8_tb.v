`timescale 1ns / 100ps

module adder8_tb;

    // �����ź�
    reg [7:0] A, B;
    reg Cin;
    reg en_n;

    // ����ź�
    wire [7:0] S;
    wire Cout;

    // ʵ��������ģ��
    adder8 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .en_n(en_n),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // ��ʼ��
        A = 8'b00000000; B = 8'b00000000; Cin = 0; en_n = 1; // ����
        #10;

        // case 1: en_n=1�����üӷ�����
        A = 8'b00000001; // 1
        B = 8'b00000010; // 2
        Cin = 1;
        #10;

        // case 2: en_n=0�����ã����޽�λ
        en_n = 0;
        A = 8'b00000001; // 1
        B = 8'b00000010; // 2
        Cin = 0;
        #10;

        // case 3: en_n=0���н�λ
        A = 8'b11111111; // 255
        B = 8'b00000001; // 1
        Cin = 0;
        #10;

        // case 4: ȫΪ1���г�ʼ��λ
        A = 8'b11111111; // 255
        B = 8'b11111111; // 255
        Cin = 1;
        #10;

        // case 5: �������
        A = 8'd60;       // 60 -> 00111100
        B = 8'd167;      // 167 -> 10100111
        Cin = 1;
        #10;

        // case 6: �ı�ʹ�ܣ����½���
        en_n = 1;
        A = 8'd255;      // 11111111
        B = 8'd1;        // 00000001
        Cin = 1;
        #10;

        $finish;
    end

endmodule
