module paridade(
    //descrevendo os 8 bits de entrada do gerador
    input logic b7, b6, b5, b4, b3, b2, b1, b0,
    //descrevendo o bit de saída do gerador
    output logic paridade
);
    //expressão de saída do gerador de paridade ímpar
    assign paridade = ~(b7 ^ b6 ^ b5 ^ b4 ^ b3 ^ b2 ^ b1 ^ b0);
endmodule 