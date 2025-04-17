module adder8_sync(
    input [7:0] a,      // 8位输入a
    input [7:0] b,      // 8位输入b
    input op,           // 进位输入(op = cin；0:加法，1:减法)
    input en_n,        // 低有效控制端
    output [7:0] sum,  // 8位和输出
    output cout        // 进位输出
    );
    
    wire [7:0] b_mux;
    wire [3:0] sum_low, sum_high;
    wire carry_low, carry_out;

    // 取反b（op=1时）实现减法
    assign b_mux = op ? ~b : b;
    
    // 第一个4位加法器（低4位）
    sync_adder4 u_adder_low (
        .a(a[3:0]),
        .b(b_mux[3:0]),
        .cin(op),           // 加法cin=0，减法cin=1
        .en_n(en_n),
        .sum(sum[3:0]),
        .cout(carry_low)
    );

    
    // 第二个4位加法器（高4位）
    sync_adder4 u_adder_high (
        .a(a[7:4]),
        .b(b_mux[7:4]),
        .cin(carry_low),
        .en_n(en_n),
        .sum(sum[7:4]),
        .cout(cout)
    );
endmodule
