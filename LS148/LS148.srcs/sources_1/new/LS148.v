//8��-3�����ȱ����� 74148
module LS148(
    input wire I0,I1,I2,I3,I4,I5,I6,I7, //�ͼ����߼�
    input wire EI, //����ʹ��, ����Ч
    output reg A0, //��������λ
    output reg A1, //��������м�λ
    output reg A2, //��������λ
    output reg E0, //���ʹ�ܣ�����Ч
    output reg GS  //���ʹ�ܣ�����Ч
    ); 
always @ (*) begin
    if (EI){A2,A1,A0,GS,E0} = 5'b11111;
        else if(~I7) {A2,A1,A0,GS,E0}=5'b00000;
        else if (~I6){A2,A1,A0,GS,E0}=5'b00101;
        else if (~I5){A2,A1,A0,GS,E0}=5'b01001;
        else if (~I4){A2,A1,A0,GS,E0}=5'b01101;
        else if (~I3){A2,A1,A0,GS,E0}=5'b10001;
        else if (~I2){A2,A1,A0,GS,E0}=5'b10101;
        else if (~I1){A2,A1,A0,GS,E0}=5'b11001;
        else if (~I0){A2,A1,A0,GS,E0}=5'b11101;
        else         {A2,A1,A0,GS,E0}=5'b11110;
end
endmodule