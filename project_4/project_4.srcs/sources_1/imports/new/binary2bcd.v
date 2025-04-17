module binary2bcd(
    input [7:0] binary,  // 8位二进制输入（0-255）
    output reg [3:0] tens,  // 十位BCD输出
    output reg [3:0] ones   // 个位BCD输出
);
    integer i;
    reg [11:0] bcd; // 12位宽，可以存储0-255的BCD码
    
    always @(*) begin
        bcd = 12'b0;  // 初始化BCD寄存器
        for (i = 7; i >= 0; i = i - 1) begin
            // 如果BCD的每一位大于等于5，加3
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            
            // 左移一位
            bcd = bcd << 1;
            bcd[0] = binary[i]; // 将输入的二进制位移入
        end
        
        // 提取十位和个位的BCD值
        tens = bcd[7:4];
        ones = bcd[3:0];
    end
endmodule
