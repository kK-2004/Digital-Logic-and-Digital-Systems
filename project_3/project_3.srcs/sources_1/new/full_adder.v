module full_adder(
    input A,
    input B,
    input C,
    input en_n,
    output reg S,
    output reg Cout
    );
    
    always @ (A,B,C,en_n) begin
        if (en_n) {S,Cout} = 2'b00;
        else begin
            case ({A,B,C})
            3'b000: {S,Cout} = 2'b00;
            3'b001: {S,Cout} = 2'b10;
            3'b010: {S,Cout} = 2'b10;
            3'b011: {S,Cout} = 2'b01;
            3'b100: {S,Cout} = 2'b10;
            3'b101: {S,Cout} = 2'b01;
            3'b110: {S,Cout} = 2'b01;
            3'b111: {S,Cout} = 2'b11;
            endcase
        end
        end    
endmodule
