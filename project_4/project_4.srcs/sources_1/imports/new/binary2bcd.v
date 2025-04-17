module binary2bcd(
    input [7:0] binary,  // 8λ���������루0-255��
    output reg [3:0] tens,  // ʮλBCD���
    output reg [3:0] ones   // ��λBCD���
);
    integer i;
    reg [11:0] bcd; // 12λ�����Դ洢0-255��BCD��
    
    always @(*) begin
        bcd = 12'b0;  // ��ʼ��BCD�Ĵ���
        for (i = 7; i >= 0; i = i - 1) begin
            // ���BCD��ÿһλ���ڵ���5����3
            if (bcd[3:0] >= 5) bcd[3:0] = bcd[3:0] + 3;
            if (bcd[7:4] >= 5) bcd[7:4] = bcd[7:4] + 3;
            if (bcd[11:8] >= 5) bcd[11:8] = bcd[11:8] + 3;
            
            // ����һλ
            bcd = bcd << 1;
            bcd[0] = binary[i]; // ������Ķ�����λ����
        end
        
        // ��ȡʮλ�͸�λ��BCDֵ
        tens = bcd[7:4];
        ones = bcd[3:0];
    end
endmodule
