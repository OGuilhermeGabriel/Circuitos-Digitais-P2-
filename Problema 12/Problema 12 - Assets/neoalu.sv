module neoalu(
    //definindo os bits do opcode
    input logic opc2, opc1, opc0,
    //definindo a entrada 8 bits de a
    input logic [7:0] a,
    //definindo a entrada 8 bits de b  
    input logic [7:0] b,
    //saída 8 bits da alu
    output logic [7:0] s
);

always @(*) begin
    case ({opc2,opc1, opc0}) //concatenei aqui pra formar uma série de 3 bits do opcode
        // cada operação relacionada à cada opcode será descrita aqui
        // aplicando uma abordagem por fluxo de dados
        3'b000: s = a | b; // a or b -> opcode = 000
        3'b001: s = a & b; // a and b -> opcode = 001
        3'b010: s = a ^ b; // a xor b -> opcode = 010
        3'b011: s = ~a; // ~a -> opcode = 011
        3'b100: s = a + b; // a + b -> opcode = 100
        3'b101: s = a - b; // a - b -> opcode = 101
        3'b110: s = a + 1; // a + 1 -> opcode = 110
        3'b111: s = b + 1; // b + 1 -> opcode = 111
        // caso padrão (default): recebe um valor de 8 bit indefido e diferente do opcode. Ou seja, caso padrão = fora do escopo do opcode = erro
        default: s = 8'bx; // resultado inválido
    endcase
end
endmodule