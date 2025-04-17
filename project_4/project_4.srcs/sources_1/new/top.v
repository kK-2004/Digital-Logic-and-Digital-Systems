module top(
    input [7:0] A,
    input [7:0] B,
    input op,           // 0: 加法，1: 减法
    input en_n,         // 低有效使能信号
    output [7:0] S,
    output [6:0] seg_tens,  // 十位数码管输出
    output [6:0] seg_ones,  // 个位数码管输出
    output Cout          // 进位/借位输出
);

    wire [3:0] tens, ones;

    // 实例化8位加减器（组合两个sync_adder4）
    adder8_sync u_arith (
        .a(A),
        .b(B),
        .op(op),
        .en_n(en_n),
        .sum(S),
        .cout(Cout)
    );

    // 二进制转BCD
    binary2bcd u_bcd (
        .binary(S),
        .tens(tens),
        .ones(ones)
    );

    // 数码管显示（十位）
    dpy u_dpy_tens (
        .bcd(tens),
        .seg(seg_tens)
    );

    // 数码管显示（个位）
    dpy u_dpy_ones (
        .bcd(ones),
        .seg(seg_ones)
    );

endmodule