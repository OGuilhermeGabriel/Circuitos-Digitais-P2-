# Lista de Projeto 01 - Circuitos Digitais
Projeto direcionado à disciplina de Circuitos Digitais, ministrada pelo Prof Dr Pedro Thiago Valério de Souza no período 2024.1, na Universidade Federal Rural do Semi-Árido (UFERSA).

# Autores 
- Caio Barreto Meyer | [Caio B. Meyer](https://github.com/TaiCaio) 
- Guilherme Gabriel Saldanha Pereira | [OGuilhermeGabriel](https://github.com/OGuilhermeGabriel)

# Sumário 
- [Problema 01](#problema-01)
- [Problema 02](#problema-02)
- [Problema 03](#problema-03)
- [Problema 04](#problema-04)
- [Problema 05](#problema-05)
- [Problema 06](#problema-06)
- [Problema 07](#problema-07)
- [Problema 08](#problema-08)
- [Problema 09](#problema-09)
- [Problema 10](#problema-10)
- [Problema 11](#problema-11)
- [Problema 12](#problema-12)
- [Referências](#referências)

# Lista de Projetos 
Implemente os seguintes circuitos em SystemVerilog utilizando a abordagem designada:

# Problema 01
Um circuito gerador de paridade ímpar de um número de 8 bits utilizando fluxo de dados e operadores lógicos.

## Resolução
Um gerador de paridade ímpar pode ser representado por um circuito composto por 8 entradas (para 8 bits) associados por XNOR's de forma cascata. Nesse sentido, a saída irá gerar um único bit: Caso a sequência de valores dos 8 bits tenha uma quantidade de 1's par, o bit de paridade gerado irá ter o valor 1. Caso a sequência de valores dos 8 bits tenha uma quantidade de 1's ímpar, o bit de paridade gerado irá ter o valor 0.

Como o problema pede para ser resolvido por fluxo de dados, a descrição do circuito foi feita em termos das suas próprias expressões lógicas, relacionando as entradas do gerador com a saída do mesmo. 

## Descrição em *systemverilog* 
~~~
module paridade(
    //descrevendo os 8 bits de entrada do gerador
    input logic b7, b6, b5, b4, b3, b2, b1, b0,
    //descrevendo o bit de saída do gerador
    output logic paridade
);
    //expressão de saída do gerador de paridade ímpar
    assign paridade = ~(b7 ^ b6 ^ b5 ^ b4 ^ b3 ^ b2 ^ b1 ^ b0);
endmodule
~~~

# Problema 02
Um decodificador para display de sete segmentos ânodo comum, que seja capaz de representar os dígitos em hexadecimal. Utilize a abordagem comportamental e estrutura case.

## Resolução

A primeira coisa a se fazer para projetar este decodificador é, especificamente, determinar como serão os segmentos quando eles estiverem ligados. 

A imagem abaixo mostra o modelo adotado para representar os dígitos em hexadecimal.

![P2_Display](/Problema%2002/Problema%2002%20-%20Assets/segmentos.png)

Em seguida, faz-se necessário fazer a tabela verdade, para relacionar cada dígito hexadecimal (formada por 4 bits) com a sequência de segmentos ligados e desligados que formam o dígito visualmente. 

- TABELA VERDADE

 *b3* | *b2* | *b1* | *b0* |*a*|*b*|*c*|*d*|*e*|*f*|*g*| 
 -----| -----| -----| -----| --| --| --| --| --| --| --|  
  0   |  0   |  0   |  0   | 0 | 0 | 0 | 0 | 0 | 0 | 1 |
  0   |  0   |  0   |  1   | 1 | 0 | 0 | 1 | 1 | 1 | 1 |
  0   |  0   |  1   |  0   | 0 | 0 | 1 | 0 | 0 | 1 | 0 |
  0   |  0   |  1   |  1   | 0 | 0 | 0 | 0 | 1 | 1 | 0 |
  0   |  1   |  0   |  0   | 1 | 0 | 0 | 1 | 1 | 0 | 0 |
  0   |  1   |  0   |  1   | 0 | 1 | 0 | 0 | 1 | 0 | 0 |
  0   |  1   |  1   |  0   | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
  0   |  1   |  1   |  1   | 0 | 0 | 0 | 1 | 1 | 1 | 1 |
  1   |  0   |  0   |  0   | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
  1   |  0   |  0   |  1   | 0 | 0 | 0 | 0 | 1 | 0 | 0 |
  1   |  0   |  1   |  0   | 0 | 0 | 0 | 1 | 0 | 0 | 0 |
  1   |  0   |  1   |  1   | 1 | 1 | 0 | 0 | 0 | 0 | 0 |
  1   |  1   |  0   |  0   | 0 | 1 | 1 | 0 | 0 | 0 | 1 |
  1   |  1   |  0   |  1   | 1 | 0 | 0 | 0 | 0 | 1 | 0 |
  1   |  1   |  1   |  0   | 0 | 1 | 1 | 0 | 0 | 0 | 0 |
  1   |  1   |  1   |  1   | 0 | 1 | 1 | 1 | 0 | 0 | 0 |

## Descrição em *systemverilog*

~~~
module display(
    //definindo a sequência de bits que definirá o segmento
    input logic [3:0] digito,
    //definindo os 7 segmentos do display
    output logic [6:0] segmento 
);
    //aplicando um always_combinacional p/ o bloco condicional
    always_comb begin 
        case(digito)
            4'h0 : segmento = 7'b0000001; //segmento para o digito hex 0
            4'h1 : segmento = 7'b1001111; //segmento para o digito hex 1
            4'h2 : segmento = 7'b0010010; //segmento para o digito hex 2
            4'h3 : segmento = 7'b0000110; //segmento para o digito hex 3
            4'h4 : segmento = 7'b1001100; //segmento para o digito hex 4
            4'h5 : segmento = 7'b0100100; //segmento para o digito hex 5
            4'h6 : segmento = 7'b0100000; //segmento para o digito hex 6
            4'h7 : segmento = 7'b0001111; //segmento para o digito hex 7
            4'h8 : segmento = 7'b0000000; //segmento para o digito hex 8
            4'h9 : segmento = 7'b0000100; //segmento para o digito hex 9
            4'hA : segmento = 7'b0001000; //segmento para o digito hex A
            4'hB : segmento = 7'b1100000; //segmento para o digito hex B
            4'hC : segmento = 7'b0110001; //segmento para o digito hex C
            4'hD : segmento = 7'b1000010; //segmento para o digito hex D
            4'hE : segmento = 7'b0110000; //segmento para o digito hex E
            4'hF : segmento = 7'b0111000; //segmento para o digito hex F
            default : segmento = 7'b1111111; // segmento para condições impossíveis
        endcase
    end
endmodule 
~~~

Utilizando a abordagem comportamental, onde o circuito deve ser descrito em termos do seu comportamento algorítmico, foi implementada então a estrutura *case* dentro do procedimento *always_comb*, sendo um procedimento *always* utilizado para mapear circuitos lógicos combinacionais, como este circuito o qual descreve o display. 

Além disso, vale mencionar a importancia da implementação da estrutura *case*, a qual descreve as condições de cada digíto hexadecimal para cada sequência dos 7 segmentos de forma rápida e prática. Vale salientar ainda que, em termos de projeto, a escolha "*default*" foi atribuida para quando nenhum dos dígitos hexadecimais registrados seja selecionado, onde no display, nenhum segmento será aceso. 

# Problema 03
Um decodificador 3x8 com entrada de habilitação utilizando fluxo de dados e operadores lógicos.

## Resolução

Um decodificador 3x8 é um bloco lógico combinacional definido por 3 entradas e 8 saídas, onde para cada combinação das entradas, uma única saída será ativada. Dessa forma, a tabela verdade pode ser representada dessa forma:
 
- TABELA VERDADE

 *b2* | *b1* | *b0* |*e7*|*e6*|*e5*|*e4*|*e3*|*e2*|*e1*|*e0*| 
 -----| -----| -----| -- | -- | -- | -- | -- | -- | -- | -- |  
  0   |  0   |  0   | 0  | 0  | 0  | 0  | 0  | 0  | 0  | 1  |
  0   |  0   |  1   | 0  | 0  | 0  | 0  | 0  | 0  | 1  | 0  |
  0   |  1   |  0   | 0  | 0  | 0  | 0  | 0  | 1  | 0  | 0  |
  0   |  1   |  1   | 0  | 0  | 0  | 0  | 1  | 0  | 0  | 0  |
  1   |  0   |  0   | 0  | 0  | 0  | 1  | 0  | 0  | 0  | 0  |
  1   |  0   |  1   | 0  | 0  | 1  | 0  | 0  | 0  | 0  | 0  |
  1   |  1   |  0   | 0  | 1  | 0  | 0  | 0  | 0  | 0  | 0  |
  1   |  1   |  1   | 1  | 0  | 0  | 0  | 0  | 0  | 0  | 0  |

## Descrição em *systemverilog*

~~~
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
~~~

# Problema 04
Um multiplexador 4x1 utilizando fluxo de dados e operadores lógicos.

## Resolução
O mux 4x1 é um bloco lógico combinacional contendo quatro entradas e uma única saída, onde as entradas são selecionadas a partir dos bits de seleção que compõe a chave seletora. Dessa forma, como o que determina as combinações das entradas são os bits de seleção, faz-se necessário criar uma tabela verdade relacionando os bits da chave seletora com a saída do mux. 

- TABELA VERDADE 

 *s1* | *s0* |  *f* |
  --  |  --  | ---  |
   0  |   0  | *i0* |
   0  |   1  | *i1* |
   1  |   0  | *i2* |
   1  |   1  | *i3* |

Como tratasse de uma abordagem por fluxo de dados e operadores lógicos, faz-se necessário encontrar a expressão que define a saída do mux. Uma vez que o multiplexador pode ser projetado com portas lógicas como mostra a figura a baixo, é possível encontrar a expressão lógica para a saída *f*.

![P4_mux_logic](/Problema%2004/Problema%2004%20-%20Assets/mux_logic.jpg)

## Descrição em *systemverilog*
~~~
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
~~~

# Problema 05
Um multiplexador 4x1 de 8 bits utilizando abordagem comportamental e estrutura case.

## Resolução
O mesmo bloco combinacional será descrito, só que desta vez, será feito por meio de outra abordagem.

Ao invés do circuito ser descrito em termos de suas expressões de saída, ele será descrito baseado no seu comportamento algorítmico, utilizando a estrutura "*case*" por meio dentro de um procedimento "*always*".

## Descrição em *systemverilog*

~~~
module mux2 (
    //declarando as 4 entradas 
    input logic [3:0] i,
    //declarando os 2 bits seletores 
    input logic [1:0] s,
    //declarando a saída 
    output logic f 
);
    always_comb begin
        case (s)
            2'b00 : f = i[0]; 
            2'b01 : f = i[1];
            2'b10 : f = i[2];
            2'b11 : f = i[3];
            //valor padrão caso a combinação de bits de seleção dê algo impossível
            default: f = 1'b0; // saída = 0 
        endcase 
    end
endmodule
~~~

Dessa vez, as entradas normais e entradas de seleção foram concatenadas e, com o procedimento "*always_comb*", fora utilizada a estrutura condicional "*case*". Contudo, note que a lógica por trás da descrição deste circuito combinacional ainda continua a mesma.

# Problema 06
Meio somador, utilizando abordagem por fluxo de dados e operadores lógicos.

## Resolução
Também conhecido como *half adder*, tratasse de um circuito que soma duas entradas e a saída retorna a soma das duas entradas além do carry-out, bit necessário caso a soma seja 1+1.

## Descrição em *systemverilog*

~~~
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
~~~

# Problema 07
Somador completo, utilizando abordagem por fluxo de dados e operadores lógicos.

## Resolução
Também conhecidos como *full-adder*, a única diferença entre os somadores completos para os meio-somadores é a presença da entrada de carry-in no bloco lógico.

## Descrição em *systemverilog*
~~~
module fulladder(
    //declarando as entradas do full-adder
    input logic a,b,cin, 
    //declarando as saídas do full-adder
    output logic s,cout
);
    //declarando as expressões de saída do full-adder
    assign s = a ^ b ^ cin;
    assign cout = (a&b) | (a&cin) | (b&cin); 
endmodule
~~~

# Problema 08
Somador de 4 bits com entrada de carry in, utilizando um conjunto de somadores completos e abordagem hierarquica.

## Resolução
Para fazer o somador de 4 bits, será necessário primeiramente criar o módulo do somador completo para que, em seguida, seja possível criar o arquivo do somador de 4 bits, onde serão criadas 4 instâncias a partir deste módulo do *full-adder*. Dessa forma, por meio dos 4 blocos de *full-adders* criados, o *4 bits-adder* contará com entradas *a* e *b* e saída *s* de 4 bits, os quais conterão os valores das instâncias criadas a partir do módulo do *full-adder*.

## Descrição em *systemverilog*

Primeiramente, será necessário descrever o módulo do somador completo

~~~
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
~~~

Em outro arquivo, o somador de 4 bits será descrito

~~~
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
~~~

# Problema 09
Somador de 8 bits com entrada de carry in, utilizando abordagem por fluxo de dados e operadores aritméticos.

## Resolução
Dessa vez será um pouco mais simples de descrever o somador, uma vez que agora, tal bloco combinacional será descrito por meio das expressões que definem a saída do mesmo. Dessa forma, a expressão obtida será muito mais simples de ser representada por meio dos operadores aritméticos.

## Descrição em *systemverilog*

~~~
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
~~~

# Problema 10
Um circuito que realiza, conjuntamente, as operações de soma e subtração entre números de 8 bits a partir de dois sinais de controle 𝑀, de tal forma que quando 𝑀 = 0 o circuito deverá realizar a soma dos dois números e quando 𝑀 = 1, o circuito realizará a subtração de dois números. Utilize o somador de 8 bits projetado no item (9) em conjunto com portas lógicas adicionais, utilizando a abordagem por hierarquia.

## Resolução

Para projetar este circuito, será necessário ter uma boa interpretação e entender que com um mesmo somador de 8 bits, é possível criar um subtrator de 8 bits utilizando um conjunto de portas lógicas adicionais, especificamente, as portas XOR. Dessa forma, a partir do sinal de controle *M*, haverão momentos em que o *adder* irá se comportar como somador (*M* = 0) e haverão momentos em que o *adder* irá se comportar como subtrator (*M* = 0)  

Inicialmente, podemos entender que em um somador, as entradas se  comportar de tal forma:

*A + B*

E em um subtrator temos que: 

*A - B*

Contudo, podemos interpretar esta subtração como a soma de *A* com o valor negativo de *B*. Portanto: 

*A - B = A + (-B)*

Consequentemente, quando for a hora do *adder* se comportar como subtrator ele irá simplesmente somar o valor de *A* com o valor negativo de *B*. Nesse sentido, o valor negativo de *B* será definido como o complemento de dois de *B*.

Teoricamente, para realizar o complemento de dois, primeiramente inverte-se cada bit do sinal e, em seguida, soma-se mais 1.

Na prática, as portas XOR's implementadas no circuito servem para inverter cada um dos 8 bits de *B* e no *carry-in*, é adicionado o valor de 1 para realizar o complemento de 2 de *B*.

A imagem abaixo, tirada de uma aula no youtube (cujo link estará nas referências bibliográficas) representa esta mesma lógica sendo aplicada para 4 bits.

![adder_sub](/Problema%2010/Problema%2010%20-%20Assets/fonte%20logica%20digital%20fabrica%20de%20noobs.jpg)

## Descrição em *systemverilog*

Primeiramente, será criado um bloco menor o qual será responsável por descrever a estrutra do somador de 8 bits. Nesse caso, será reaproveitada a descrição do item (9), o qual já descreve um somador de 8 bits em termos de suas expressões. Só que, ao invés de pegar o somador de 8 bits já feito, este será instânciado por um bloco menor: por um somador de 1 bit.

~~~
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
~~~

Em seguida, no módulo principal, será descrito o somador/subtrator, usando como base o somador de 8 bits.

~~~
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
~~~

# Problema 11
Um circuito multiplicador de dois números de 8 bits, utilizando abordagem por fluxo de dados e operadores aritméticos.

## Resolução
A forma de descrever este circuito é similar ao problema 09.

## Descrição em *systemverilog*

~~~
module multiplicador (
    // declarando as entradas em 8 bits
    input logic [7:0] a, b,
    // declarando a saída do multiplicador em 16 bits (dobro) 
    output logic [15:0] p
);
    // definindo as expressões lógicas da sáida e do carry-out
    assign p = a * b;
endmodule 
~~~

# Problema 12
Uma unidade lógico-aritmética com a seguinte tabela de operação utilizando a abordagem que desejar:

![P12OPC](/Problema%2012/Problema%2012%20-%20Assets/opcode.jpg)

Sendo 𝐴 e 𝐵 dois números de 8 bits.

## Resolução

Para este projeto será necessário utilizar a abordagem comportamental. Especificamente, será aplicado um procedimento *always* o qual irá definir por meio de uma estrutura *case*, todos as operações que a ALU irá fazer baseado nas combinações formadas pelos bits do *op code*.   

## Descrição em *systemverilog*

~~~
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
~~~

# Referências

-  Fábrica de Noobs. Lógica Digital #17 - Somadores e Subtratores. YouTube, 16 de dez. de 2019. Disponível em: [Lógica Digital #17 - Somadores e Subtratores](https://www.youtube.com/watch?v=IQkYBmNVo_U). Acesso em: 22 de out. de 2024.