module fulladder (
    //declarando as entradas do full-adder 
    input logic a, b, cin,
    //declarando as saídas do full-adder 
    output logic s, cout 
);
    //declarando as expressões de saída do full-adder 
    assign s = a ^ b ^ cin; 
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule 