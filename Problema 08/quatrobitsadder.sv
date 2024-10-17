module quatrobitsadder (
    // declarando as entradas do somador de 4 bits 
    input logic [3:0] a, b,
    // declarando o carry-in do somador 
    input logic cin,
    // declarando a saída da soma em 4 bits
    output logic [3:0] s, 
    // declarando o carry-out do somador 
    output logic cout
);
    // declarando os sinais intermediários dos carrys
    // ~ são os sinais de carry que estão ENTRE os blocos somadores 
    logic c1, c2, c3; 

    // instânciando os 4 full-adders 
    fulladder fa0 (.a(a[0]), .b(b[0]), .cin(cin), .s(s[0]), .cout(c1));
    fulladder fa1 (.a(a[1]), .b(b[1]), .cin(c1), .s(s[1]), .cout(c2));
    fulladder fa2 (.a(a[2]), .b(b[2]), .cin(c2), .s(s[2]), .cout(c3));
    fulladder fa3 (.a(a[3]), .b(b[3]), .cin(c3), .s(s[3]), .cout(cout));

endmodule