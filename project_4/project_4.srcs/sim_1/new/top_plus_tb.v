`timescale 1ns/100ps

module top_plus_tb;

    // 输入信号
    reg [7:0] a, b;
    reg op;          // 操作：0-加法，1-减法
    reg en_n;        // 低电平有效

    // 输出信号
    wire [6:0] seg_tens, seg_ones;
    wire [7:0] S;
    wire cout;

    // BCD输出
    wire [3:0] tens, ones; // 十位和个位BCD输出
   
    // 实例化顶层模块
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

    // 实例化二进制到BCD转换模块
    binary2bcd u_binary2bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );

    // 测试过程
    initial begin
        $display("Time\tA\tB\tOP\tResult (seg)\tCOUT");

        en_n = 0;   // 启用模块

        // 加法测试：20 + 35 = 55
        a = 8'd20;
        b = 8'd35;
        op = 0;
        #10;
        $display("%4t\t%3d\t%3d\tADD\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // 减法测试：100 - 45 = 55
        a = 8'd100;
        b = 8'd45;
        op = 1;
        #10;
        $display("%4t\t%3d\t%3d\tSUB\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // 减法测试：40 - 100 = 196（负数补码表现）
        a = 8'd40;
        b = 8'd100;
        op = 1;
        #10;
        $display("%4t\t%3d\t%3d\tSUB\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        // 加法溢出测试：200 + 100 = 300 -> 显示 44（因为8位最大255）
        a = 8'd200;
        b = 8'd100;
        op = 0;
        #10;
        $display("%4t\t%3d\t%3d\tADD\t%7b %7b\t%b", $time, a, b, seg_tens, seg_ones, cout);

        $stop;
    end

endmodule
