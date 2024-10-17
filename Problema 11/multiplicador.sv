module multiplicador (
    // declarando as entradas em 8 bits
    input logic [7:0] a, b,
    // declarando a saída do multiplicador em 16 bits (dobro) 
    output logic [15:0] p
);
    // definindo as expressões lógicas da sáida e do carry-out
    assign p = a * b;
endmodule 