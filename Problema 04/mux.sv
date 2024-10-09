module mux(
    //declarando as entradas 
    input logic i0, i1, i2, i3,
    //declarando a chave seletora (que são entradas também)
    input logic s0, s1,
    //declarando a saída
    output logic f
);
    //atribuindo a expressão lógica para a saída do mux 4x1
    assign f = (i0&(~s1)&(~s0)) | (i1&(~s1)&s0) | (i2&s1&(~s0)) | (i3&s1&s0);
endmodule