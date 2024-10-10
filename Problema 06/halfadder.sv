module halfadder (
    //definindo as entradas do half-adder
    input logic a, b,
    //definindo as saídas do half-adder
    output logic s, cout
);
    //definindo as expressões das saídas do meio-somador
    assign s = a ^ b;
    assign cout = a & b;                                                                

endmodule 