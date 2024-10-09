module decodificador(
    //colocando as entradas do decodificador 
    input logic b0,b1,b2, //b2 = X, b1 = Y, b0 = Z
    //colocando as saídas do decodificador
    output logic e0, e1, e2, e3, e4, e5, e6, e7
);
    // atribuindo as expressões para cada saída do decodificador (as 8)
    assign e0 = ((~b2)&(~b1)&(~b0));
    assign e1 = ((~b2)&(~b1)&(b0));
    assign e2 = ((~b2)&(b1)&(~b0));
    assign e3 = ((~b2)&(b1)&(b0));
    assign e4 = ((b2)&(~b1)&(~b0));
    assign e5 = ((b2)&(~b1)&(b0));
    assign e6 = ((b2)&(b1)&(~b0));
    assign e7 = ((b2)&(b1)&(b0));
endmodule 
