// criando o módulo do menor bloco lógico: 1-bit adder 
module umbitadder (
    // entradas do somador de 1 bit
    input logic a, b, cin,
    // saídas do somador de 1 bit
    output logic s, cout
);
    // atribuindo as expressões de saída, baseadas nas entradas
    assign {s, cout} = a + b + cin; 
    // concatenei "s" e "cout", já que a expressão é a mesma para os 2 bits 
endmodule 

// criando o módulo do 8-bits adder 
module oitobitsadder (
    // entradas A e B de 8 bits
    input logic [7:0] A, B,
    // cin
    input logic cin,
    // saída da soma de 8 bits 
    output logic [7:0] s,
    // cout
    output logic cout
);

    // definindo o sinal intermediário de carry, o qual irá passar entre cada 1-bit adder
    logic [7:0] carry;

    // instanciando o 8-bits adder
    umbitadder FA0 (.a(A[0]), .b(B[0]), .cin(cin), .s(s[0]), .cout(carry[0]));
    umbitadder FA1 (.a(A[1]), .b(B[1]), .cin(carry[0]), .s(s[1]), .cout(carry[1]));
    umbitadder FA2 (.a(A[2]), .b(B[2]), .cin(carry[1]), .s(s[2]), .cout(carry[2]));
    umbitadder FA3 (.a(A[3]), .b(B[3]), .cin(carry[2]), .s(s[3]), .cout(carry[3]));
    umbitadder FA4 (.a(A[4]), .b(B[4]), .cin(carry[3]), .s(s[4]), .cout(carry[4]));
    umbitadder FA5 (.a(A[5]), .b(B[5]), .cin(carry[4]), .s(s[5]), .cout(carry[5]));
    umbitadder FA6 (.a(A[6]), .b(B[6]), .cin(carry[5]), .s(s[6]), .cout(carry[6]));
    umbitadder FA0 (.a(A[7]), .b(B[7]), .cin(carry[6]), .s(s[7]), .cout(cout)); 
    // obs: carry[7] = cout
endmodule