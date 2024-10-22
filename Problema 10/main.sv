// modulo principal -> é aqui que o somador/subtrator de 8 bits será descrito
module main (
    // declarando as entradas de 8 bits A e B
    input logic [7:0] A, B,
    // declarando o sinal de controle M como uma entrada do bloco lógico  
    input logic M,
    // declarando a saída do somador/subtrator => resultado da operação
    output logic resultado, 
    // cout 
    output logic cout  
);
    // declarando os sinais intermediários: 
    logic [7:0] B_c2;  // sinal responsável por inverter cada bit da entrada "B"
    logic cin; // "cin" não será uma entrada mais sim um sinal intermediário. 
    // Isso acontece pq "cin" estará ligado à entrada de controle M, para somar + 1, para fazer o complemento de 2, logo, "cin = M"

    // CASO M = 1 -> INVERTE "B" [complemento de 2], SE NÃO -> B
    assign B_c2 = B ^ {8{M}};
    // implementando uma XOR pra cada bit de M, que será ou M = 00000000 (0) ou M = 11111111 (1) (precisa fazer isso para que a XOR consiga lidar com os 8 bits vindos de "B")
    assign cin = M;

    // INSTANCIANDO O 8-BITS ADDER/SUB, tendo como base o somador de 8-bits descrito anteriormente
    oitobitsadder main (
        .A(A),
        .B(B),
        .cin(cin),
        .s(resultado),
        .cout(cout)  
    );

endmodule