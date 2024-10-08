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
Um decodificador 3×8 com entrada de habilitação utilizando fluxo de dados e operadores lógicos.

## Resolução

## Descrição em *systemverilog*

# Problema 04
Um multiplexador 4×1 utilizando fluxo de dados e operadores lógicos.

## Resolução

## Descrição em *systemverilog*

# Problema 05
Um multiplexador 4×1 de 8 bits utilizando abordagem comportamental e estrutura case.

## Resolução

## Descrição em *systemverilog*

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