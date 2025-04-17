module adder8(
    input [7:0] A,
    input [7:0] B,
    input Cin,
    input en_n,
    output [7:0] S,
    output Cout
    );
    wire [6:0] carry; // 中间进位线
    
    // 第0位例化
    full_adder u0 (
        .A(A[0]),
        .B(B[0]),
        .C(Cin),
        .en_n(en_n),
        .S(S[0]),
        .Cout(carry[0])
    );

    // 第1~6位例化
    genvar i;
    generate
        for (i = 1; i < 7; i = i + 1) begin : FA_GEN
            full_adder u (
                .A(A[i]),
                .B(B[i]),
                .C(carry[i-1]),
                .en_n(en_n),
                .S(S[i]),
                .Cout(carry[i])
            );
        end
    endgenerate

    // 第7位例化
    full_adder u7 (
        .A(A[7]),
        .B(B[7]),
        .C(carry[6]),
        .en_n(en_n),
        .S(S[7]),
        .Cout(Cout)
    );
endmodule