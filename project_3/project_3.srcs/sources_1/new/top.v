module top(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input en_n,
    output [6:0] seg_tens,  // 十位数码管
    output [6:0] seg_ones,  // 个位数码管
    output [7:0] S,
    output dp_ones,              // 小数点
    output dp_tens,              // 小数点
    output Cout
);
    wire [3:0] tens, ones;
    
    // 实例化8位加法器
    adder8 u_adder(
        .A(A),
        .B(B),
        .Cin(Cin),
        .en_n(en_n),
        .S(S),
        .Cout(Cout)
    );
    
    // 实例化二进制到BCD转换器
    binary2bcd u_bcd(
        .binary(S),
        .tens(tens),
        .ones(ones)
    );
    
    // 实例化十位数码管解码器
    dpy u_tens_decoder(
        .bcd(tens),
        .seg(seg_tens)
    );
    
    // 实例化个位数码管解码器
    dpy u_ones_decoder(
        .bcd(ones),
        .seg(seg_ones)
    );
    
    // 关闭小数点
    assign dp_tens = 1'b0;
    assign dp_ones = 1'b0;
endmodule