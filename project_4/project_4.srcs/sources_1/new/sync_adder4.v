module sync_adder4(
    input [3:0] a,      
    input [3:0] b,      
    input cin,         
    input en_n,        // 低有效控制端
    output [3:0] sum,  
    output cout        
    );
    // 内部进位信号
    wire [4:0] c;
    
    // 当en_n为低电平时，加法器工作；否则输出全0
    assign c[0] = en_n ? 1'b0 : cin;
    
    // 并行进位逻辑
    assign sum[0] = en_n ? 1'b0 : (a[0] ^ b[0] ^ c[0]);
    assign c[1] = en_n ? 1'b0 : ((a[0] & b[0]) | ((a[0] | b[0]) & c[0]));
    
    assign sum[1] = en_n ? 1'b0 : (a[1] ^ b[1] ^ c[1]);
    assign c[2] = en_n ? 1'b0 : ((a[1] & b[1]) | ((a[1] | b[1]) & c[1]));
    
    assign sum[2] = en_n ? 1'b0 : (a[2] ^ b[2] ^ c[2]);
    assign c[3] = en_n ? 1'b0 : ((a[2] & b[2]) | ((a[2] | b[2]) & c[2]));
    
    assign sum[3] = en_n ? 1'b0 : (a[3] ^ b[3] ^ c[3]);
    assign c[4] = en_n ? 1'b0 : ((a[3] & b[3]) | ((a[3] | b[3]) & c[3]));
    
    assign cout = c[4];
endmodule
