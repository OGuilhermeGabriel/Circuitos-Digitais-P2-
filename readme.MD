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

# Lista de Projetos 
Implemente os seguintes circuitos em SystemVerilog utilizando a abordagem designada:

# Problema 01
Um circuito gerador de paridade impar de um número de 8 bits utilizando fluxo de dados e operadores lógicos.

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

Utilizando a abordagem comportamental, onde o circuito deve ser descrito em termos do seu comportamento algoritmo, foi implementada então a estrutura *case* dentro do procedimento *always_comb*, sendo um procedimento *always* utilizado para mapear circuitos lógicos combinacionais, como este circuito o qual descreve o display. 

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

## Descrição em *systemverilog*

# Problema 07
Somador completo, utilizando abordagem por fluxo de dados e operadores lógicos.

## Resolução

## Descrição em *systemverilog*

# Problema 08
Somador de 4 bits com entrada de carry in, utilizando um conjunto de somadores completos e abordagem hierarquica.

## Resolução

## Descrição em *systemverilog*

# Problema 09
Somador de 8 bits com entrada de carry in, utilizando abordagem por fluxo de dados e operadores aritméticos.

## Resolução

## Descrição em *systemverilog*

# Problema 10
Um circuito que realiza, conjuntamente, as operações de soma e subtração entre números de 8 bits a partir de dois sinais de controle 𝑀, de tal forma que quando 𝑀 = 0 o circuito deverá realizar a soma dos dois números e quando 𝑀 = 1, o circuito realizará a subtração de dois números. Utilize o somador de 8 bits projetado no item (9) em conjunto com portas lógicas adicionais, utilizando a abordagem por hierarquia.

## Resolução

## Descrição em *systemverilog*

# Problema 11
Um circuito multiplicador de dois números de 8 bits, utilizando abordagem por fluxo de dados e
operadores aritméticos.

## Resolução

## Descrição em *systemverilog*

# Problema 12
Uma unidade lógico-aritmética com a seguinte tabela de operação utilizando a abordagem que desejar:

![P12OPC](/Problema%2012/Problema%2012%20-%20Assets/opcode.jpg)

Sendo 𝐴 e 𝐵 dois números de 8 bits.

## Resolução

## Descrição em *systemverilog*