`timescale 1ns / 100ps
module top_tb;
    // 输入信号
    reg [7:0] A;
    reg [7:0] B;
    reg Cin;
    reg en_n;
    
    // 输出信号
    wire [6:0] seg_tens;  // 十位数码管
    wire [6:0] seg_ones;  // 个位数码管
    wire [7:0] S;
    wire dp_ones;         // 小数点
    wire dp_tens;         // 小数点
    wire Cout;
    
    // BCD输出
    wire [3:0] tens, ones; // 十位和个位BCD输出

    // 实例化顶层模块
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
    
    // 实例化二进制到BCD转换模块
    binary2bcd u_binary2bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );
    
    // 初始化信号
    initial begin
        // 设置初始值
        A = 8'd0;
        B = 8'd0;
        Cin = 1'b0;
        en_n = 1'b1;
        
        // 等待一段时间以稳定
        #10;
        
        // 测试不同输入
        A = 8'd1; B = 8'd0; Cin = 1'b0; en_n = 1'b0;  // 1 + 0 = 1
        #10;
        
        A = 8'd15; B = 8'd10; Cin = 1'b0; en_n = 1'b0;  // 15 + 10 = 25
        #10;
       
        // 完成测试
        $stop;
    end
    
    // 显示结果
    initial begin
        $monitor("At time %t: A = %d, B = %d, Cin = %b, en_n = %b, S = %d, Cout = %b, seg_tens = %b, seg_ones = %b, tens = %d, ones = %d",
                 $time, A, B, Cin, en_n, S, Cout, seg_tens, seg_ones, tens, ones);
    end
endmodule
