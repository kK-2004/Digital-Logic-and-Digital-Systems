module adder8_sync(
    input [7:0] a,      // 8λ����a
    input [7:0] b,      // 8λ����b
    input op,           // ��λ����(op = cin��0:�ӷ���1:����)
    input en_n,        // ����Ч���ƶ�
    output [7:0] sum,  // 8λ�����
    output cout        // ��λ���
    );
    
    wire [7:0] b_mux;
    wire [3:0] sum_low, sum_high;
    wire carry_low, carry_out;

    // ȡ��b��op=1ʱ��ʵ�ּ���
    assign b_mux = op ? ~b : b;
    
    // ��һ��4λ�ӷ�������4λ��
    sync_adder4 u_adder_low (
        .a(a[3:0]),
        .b(b_mux[3:0]),
        .cin(op),           // �ӷ�cin=0������cin=1
        .en_n(en_n),
        .sum(sum[3:0]),
        .cout(carry_low)
    );

    
    // �ڶ���4λ�ӷ�������4λ��
    sync_adder4 u_adder_high (
        .a(a[7:4]),
        .b(b_mux[7:4]),
        .cin(carry_low),
        .en_n(en_n),
        .sum(sum[7:4]),
        .cout(cout)
    );
endmodule
