`timescale 1ns / 100ps

module adder8_tb;

    // 输入信号
    reg [7:0] A, B;
    reg Cin;
    reg en_n;

    // 输出信号
    wire [7:0] S;
    wire Cout;

    // 实例化被测模块
    adder8 uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .en_n(en_n),
        .S(S),
        .Cout(Cout)
    );

    initial begin
        // 初始化
        A = 8'b00000000; B = 8'b00000000; Cin = 0; en_n = 1; // 禁用
        #10;

        // case 1: en_n=1（禁用加法器）
        A = 8'b00000001; // 1
        B = 8'b00000010; // 2
        Cin = 1;
        #10;

        // case 2: en_n=0（启用），无进位
        en_n = 0;
        A = 8'b00000001; // 1
        B = 8'b00000010; // 2
        Cin = 0;
        #10;

        // case 3: en_n=0，有进位
        A = 8'b11111111; // 255
        B = 8'b00000001; // 1
        Cin = 0;
        #10;

        // case 4: 全为1，有初始进位
        A = 8'b11111111; // 255
        B = 8'b11111111; // 255
        Cin = 1;
        #10;

        // case 5: 随机测试
        A = 8'd60;       // 60 -> 00111100
        B = 8'd167;      // 167 -> 10100111
        Cin = 1;
        #10;

        // case 6: 改变使能，重新禁用
        en_n = 1;
        A = 8'd255;      // 11111111
        B = 8'd1;        // 00000001
        Cin = 1;
        #10;

        $finish;
    end

endmodule
