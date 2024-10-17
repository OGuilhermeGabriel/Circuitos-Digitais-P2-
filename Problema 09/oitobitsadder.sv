module oitobitsadder (
    // declarando as entradas "a" e "b" em 8 bits do somador 
    input logic [7:0] a, b,
    // declarando o carry-in do somador
    input logic cin,
    // declarando a saída da soma do somador em 8 bits 
    output logic [7:0] s, 
    // declarando o carry-out do somador 
    output logic cout
);
    // definindo as expressões para as saídas do somador 
    // ~ usando operadores aritméticos 
    assign s = a + b + cin; 
    assign cout = a + b + cin; 
    
endmodule 