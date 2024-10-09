module mux2 (
    //declarando as 4 entradas 
    input logic [3:0] i,
    //declarando os 2 bits seletores 
    input logic [1:0] s,
    //declarando a saída 
    output logic f 
);
    always_comb begin
        case (s)
            2'b00 : f = i[0]; 
            2'b01 : f = i[1];
            2'b10 : f = i[2];
            2'b11 : f = i[3];
            //valor padrão caso a combinação de bits de seleção dê algo impossível
            default: f = 1'b0; // saída = 0 
        endcase 
    end
endmodule