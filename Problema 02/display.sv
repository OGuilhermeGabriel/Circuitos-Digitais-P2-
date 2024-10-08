module display(
    //definindo a sequência de bits que definirá o segmento
    input logic [3:0] digito,
    //definindo os 7 segmentos do display
    output logic [6:0] segmento 
);
    //aplicando um always_combinacional p/ o bloco condicional
    always_comb begin 
        case(digito)
            4'h0 : segmento = 7'b0000001; //segmento para o digito hex 0
            4'h1 : segmento = 7'b1001111; //segmento para o digito hex 1
            4'h2 : segmento = 7'b0010010; //segmento para o digito hex 2
            4'h3 : segmento = 7'b0000110; //segmento para o digito hex 3
            4'h4 : segmento = 7'b1001100; //segmento para o digito hex 4
            4'h5 : segmento = 7'b0100100; //segmento para o digito hex 5
            4'h6 : segmento = 7'b0100000; //segmento para o digito hex 6
            4'h7 : segmento = 7'b0001111; //segmento para o digito hex 7
            4'h8 : segmento = 7'b0000000; //segmento para o digito hex 8
            4'h9 : segmento = 7'b0000100; //segmento para o digito hex 9
            4'hA : segmento = 7'b0001000; //segmento para o digito hex A
            4'hB : segmento = 7'b1100000; //segmento para o digito hex B
            4'hC : segmento = 7'b0110001; //segmento para o digito hex C
            4'hD : segmento = 7'b1000010; //segmento para o digito hex D
            4'hE : segmento = 7'b0110000; //segmento para o digito hex E
            4'hF : segmento = 7'b0111000; //segmento para o digito hex F
            default : segmento = 7'b1111111; // segmento para condições impossíveis
        endcase
    end
endmodule 