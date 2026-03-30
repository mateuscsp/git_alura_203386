/* programa hello word */

data ola;
dia = 1;
mensagem = 'hello sas';
run;

/* pag 21 inclusao de dados */

data funcionarios;
input matricula $ nome $ idade sexo $;
datalines;
m01 nome1 20 m
m02 nome2 22 f
m03 nome3 23 m
m04 nome4 24 f
m05 nome5 25 m
;
run;

PROC SQL;
CREATE TABLE TESTE AS 
SELECT * FROM FUNCIONARIOS;
QUIT;

PROC PYTHON;


proc print data = funcionarios;run;

/* apostila 2 libraries 23 */

proc datasets lib=sasdata;
proc datasets lib=sashelp;
proc datasets lib=sasuser;

data teste; set sashelp.vmember; run;

/* MENSAGENS DE LOG */

DATA OLA;
PUT "MENSAGEM PRA O LOG";
MENSAGEM = 'HELLO';
RUN;

/* IMPORTACAO DE ARQUIVOS */

DATA WORK.COLUNAS;
INFILE 'C:\CURSOSAS\ARQUIVO';
INPUT N1 1-4 C1 $ 5-9;
RUN;

/*SAIDA
Colunas
 n1 c1
 1001 aaaaa
 1002 bbbbb
 1003 ccccc
 1004 ddddd
 1005 eeeee
  */
 
/*  IMPORTACAO ARQUIVO CSV 30 */

 /* Programa 6a: importação de um arquivo CSV (forma básica) */
 DATA IMPORTAR_CSV;
 INFILE 'C:\CursoSAS\ARQUIVO_CSV.CSV' DLM=',' DSD FIRSTOBS=2;
 INPUT cep_inicial $ cep_final $ uf $;
 RUN;
 
  /* Programa 6a: importação de um arquivo CSV (forma básica) */
 DATA CEPS1;
 INFILE 'C:\CursoSAS\CEPS.CSV' DLM=',' DSD FIRSTOBS=2;
 INPUT cep_inicial $ cep_final $ uf $;
 RUN;
 
/* OBS  PARTE DOS DADOS 32*/
/* INFILE 'arq.txt' FIRSTOBS=3 OBS=7 */

/* Programa 8a: Importação de um arquivo separado por colunas 
sem comprimento fixo */

 DATA Produtos;
 INFILE 'C:\CursoSAS\PRODUTOS.txt' TRUNCOVER;
 INPUT INPUT codigo 1-4 nome $ 5-15;
 RUN; 
/*   
Produtos
 codigo nome
 1001 Leite
 1002 Biscoito
 1003 Café
 1004 Torradas
 1005 Cha
*/


/* Programa 9: leitura de um arquivo com a opção MISSOVER */
 DATA Parcelas;
 INFILE 'C:\CursoSAS\PAGAMENTOS.txt' MISSOVER;
 INPUT Nome $ P1 P2 P3;
 RUN;
 
/*   
 Parcelas
 Nome P1 P2 P3
 Amanda 150 150 .
 Ramon 300 . .
 Nelson 150 75 75
 Ines
 150 150
*/

/* Programa 10: uso da variável _INFILE_ */
 DATA Poema;
 LENGTH linha $ 30;
 INFILE 'C:\CursoSAS\POEMA.txt';
 INPUT;
 linha = _INFILE_;
 RUN;
 /*
 Poema
 linha
 Tudo Quanto Penso
 ==============
 Tudo quanto penso,
 Tudo quanto sou
 É um deserto imenso
 Onde nem eu estou
 Extensão parada
 Sem nada a estar ali,
 Areia peneirada
 Vou dar-lhe a ferroada
 Da vida que vivi
 Fernando Pessoa
*/

/* CRIACAO DE ARQUIVOS PAG 38 */

DATA FUNCIONARIOS_datalines;
     INPUT matricula $ nome $ idade sexo $;
     datalines;
     m01 george 58 m
     m02 jane   32 m
     m03 aldous 40 f
     m04 thomas 28 m
     m05 mary   43 f
     ;
     run;
     
DATA FUNCIONARIOS_cards;
     INPUT matricula $ nome $ idade sexo $;
     cards;
     m01 george 58 m
     m02 jane   32 m
     m03 aldous 40 f
     m04 thomas 28 m
     m05 mary   43 f
     ;
     run;
          
          
 * Grava o conteúdo de “Funcionarios” no arquivo SAIDA.txt;
 DATA _NULL_; 
/*  null nao gera no work */
 SET Funcionarios;   
FILE 'C:\CursoSAS\SAIDA.txt';  
PUT 
@001 matricula $CHAR3.
 nome $CHAR6.
 idade 2.
 sexo $CHAR1.
 ;
 RUN;          

/* formatos 45
A seguir são relacionados e comentados alguns exemplos de informats. Em todos os
 exemplos, w indica o máximo de dígitos.
  COMMAw.: pode ser utilizado não apenas para a leitura de números prefixados por
 “ $ ”, mas também para números contendo vírgulas como separador de milhar, tais
 como, 1,000,000. 
 PERCENTw.: converte porcentagens (Ex.: 25%). 
 DDMMYYw: para a leitura de datas no formato “dia/mês/ano”. Por exemplo:
 DDMMYY10 permite a leitura de datas com 10 digitos, como 25/12/2017. As
 próximas duas seções apresentam detalhes sobre a importação de dados contendo
 data e hora de eventos.
  PDw.: leitura de números representados no formato decimal compactado (comum
 em ambiente mainframe).
  ZDw.: leitura de números representados no formato decimal zonado (também
 comum em ambiente mainframe)


 */

/* APOSTILA 2 TIPO DATA PAG 45 */

DATA TEMPERATURAS;
     INFORMAT DIA DDMMYY10.;
     FORMAT DIA DATE9.;
     INPUT DIA GRAUS ;
     cards;
 01/04/2017 12
 02/04/2017 28
 03/04/2017 25
 04/04/2017 32
 05/04/2017 39
     ;
     run;

/* APOSTILA 2 TIPO HORAS PAG 45 */
 
 

DATA horarios;
    INFORMAT momento DATETIME20.;
    FORMAT momento DATETIME20. dia DATE9. hora time10.;
    INPUT momento :DATETIME20.;
    
    dia = DATEPART(momento);
    hora = TIMEPART(momento);
    int = hour(momento);
DATALINES;
01JAN2016:08:30:15
15MAR2016:19:45:04
04MAY2017:02:25:45
;
RUN;

/* apostilia 2 passo DATA PAG 48 */

DATA MEDIAS;
INPUT MATRICULA $ 1-8 NOTA1 NOTA2;

media = (nota1 + nota2) / 2 ;

media_ponderada = (nota1 + nota2 * 2) / 3 ;

email = matricula || "@YAHOO.COM";

datalines;
M0012017 9.8 9.5
M0022017 5.3 4.1
M0032017 2.5 8.0
M0042017 7.5 7.5
;
run;


/* IF THEN ELSE PAGINA 49 */

DATA IF_THEN_ELSE;
INPUT MATRICULA $ 1-8 NOTA1 NOTA2;

media = (nota1 + nota2) / 2 ;
media_ponderada = (nota1 + nota2 * 2) / 3 ;
email = matricula || "@YAHOO.COM";

IF MEDIA >= 6 THEN SITUACAO = "APROVADO";
ELSE SITUACAO = "REPROVADO";

IF MEDIA >=6 THEN SITUACAO2= "APROVADO";

ELSE IF MEDIA >= 4 THEN DO;
   SITUACAO2 = MEDIA_PONDERADA;
   END;


IF MEDIA >= 6 THEN SITUACAO3 = "APROVADO";

ELSE IF MEDIA >=4 THEN DO;
 MEDIA_POND = MEDIA_PONDERADA;
 IF MEDIA_POND >= 6 THEN SITUACAO3 = "APROVADO";
 ELSE SITUACAO3 = "REPROVADO";
 END;
 ELSE SITUACAO3 = "REPROVADO";
 
 
IF MEDIA >= 6 THEN SITUACAO4 = 100;

ELSE IF MEDIA_PONDERADA >=4 THEN DO;

IF   (MEDIA_PONDERADA + MEDIA) > 10 THEN SITUACAO4 = 10;
IF   (MEDIA_PONDERADA + MEDIA) < 10 THEN SITUACAO4 = 0 ; 
ELSE SITUACAO4 = 99;
END;
ELSE SITUACAO4 = 99;
 
datalines;
M0012017 9.8 9.5
M0022017 5.3 4.1
M0032017 2.5 8.0
M0042017 7.5 7.5
;

/* Comparacacao de comparacoes e logicos  */
/* pag 51 */
/*  
 Símbolo         Mnemônico   Significado
 =                  EQ           Igual
 ^=, ~= ou ¬=       NE           Diferente
 >                  GT           Maior 
<  				    LT 	  	     Menor 
>=      			GE			 Maior ou igual
 <=  				LE  		 Menor ou igual
                    IN  		 Pesquisa em um conjunto de valores
&  					AND  		 Operador E
 | ou !  			OR   		 Operador OU
 ^, ~ ou ¬  		NOT  		 Operador NÃO        
 
 Operador  Ordem de Avaliação
 NOT  			1
 AND  			2
 OR   			3
 
 comparação  resultado
 . =  n  resulta em FALSO
 . ~= n  resulta em VERDADEIRO
 . <  n  resulta em VERDADEIRO (menos infinito é sempre menor do que n)
 . <= n  resulta em VERDADEIRO (menos infinito é sempre menor ou igual a n) 
. >  n   resulta em FALSO
 . >= n  resulta em FALSO
 
   IF X = ' ' THEN … 
   IF Y = . THEN 
   
 Símbolo  	Definição   	Exemplo  	Resultado
 +  		adição  		x+10  		Adiciona o valor 10 a x.
- 			subtração 	 	y - 3 		Subtrai o valor 3 de y
 *  		multiplicação 	x * 3  		Multiplica x por 3
 /  		divisão  		y / 5  		Divide y por 5
 **  		exponenciação 	z ** 3  	Eleva z à terceira potência   
   
*/

data logicos;     
input X Y Z msg1 $ msg2 $ msg3 $; 
datalines;
1 0 -999 entrou nao entrou
;
run;

data logicos2;     
X = 1;
Y = 0;
Z = -999;
if X then msg1= 'entrou if';
if Y then msg2= 'nao entrou';
if Z then msg3= 'entrou if';

if X = 1 then entrou = "S";
ELSE entrou = "N"
;
run;

/* SUBSETTING PAG 55 */

data subsetting;
input matricula $ nota1 nota2;

media = (nota1 + nota2) / 2;

if media ge 8 then aprovado = "sim";
if media lt 8 then aprovado = "nao";

IF media > 8;

datalines;
m0012 9.9 9.5 9.6
m0014 7.5 8.2 8.6
;run;


/* delete PAG 56 */


%macro consulta(tabela);

data tabela ;
set &tabela.;
run;

%mend;

%consulta(subsetting);

%let hoje = %sysfunc(today(), date9.);

%put &=hoje;

DATA TEMPERATURAS;
     INFORMAT DIA DDMMYY10.;
     FORMAT DIA DATE9.;
     INPUT DIA GRAUS ;
     cards;
 01/04/2017 12
 02/04/2017 28
 03/04/2017 25
 04/04/2017 32
 05/04/2017 39
     ;
     run;
     
 data del;
 set temperaturas;
 
 if GRAUS < 30 then delete;
 run;
 
/*  data set options pag 56 */
/* keep */
data keep_data (keep = dia);
set temperaturas;
run;

/* drop */

data drop_data (drop=graus);
set temperaturas; run;

/* where */

data where_data (keep=graus where= (graus > 30));
set temperaturas; run; 

/* rename 58*/

data rename_data (keep= dia graus rename= (graus = temperatura));
set temperaturas; run;


/* retain 58*/

* Programa 27b: variável “classe” definida corretamente;
 DATA Temperaturas;
  INFILE 'C:\CursoSAS\TEMPERATURAS.txt';
 INPUT dia $ 1-10 graus_c;
 *declara “classe” como string de 15 posições;
 LENGTH classe $ 15; 
IF graus_c <= 20 THEN 
classe = 'FRIO';
 ELSE IF graus_c > 20 AND graus_c <= 29 THEN
 classe = 'AGRADAVEL';
 ELSE IF graus_c > 29 AND graus_c <= 34 THEN
 classe = 'CALOR';
 ELSE
 classe = 'CALOR ABSURDO';
 RUN;
 
/*  LENGTH PAGINA 61 */

/*     LENGTH SIGLA $2 ESTADO $20; /* Define tamanho das variáveis */
/*     INFILE DATALINES DSD DLM=','; /* Informa que os dados são delimitados por vírgula */



DATA UF;
LENGTH SIGLA $2 ESTADO $ 20;
INFILE DATALINES DSD DLM=",";
INPUT SIGLA $  ESTADO $;
DATALINES;
AL,Alagoas
BA,Bahia
CE,Ceará
ES,Espírito Santo
MA,Maranhão
MG,Minas Gerais
PB,Paraíba
PE,Pernambuco
PI,Piauí
PR,Paraná
RJ,Rio de Janeiro
RN,Rio Grande do Norte
RS,Rio Grande do Sul
SC,Santa Catarina
SE,Sergipe
SP,São Paulo
;
RUN;

DATA UF2;
SET UF;

LENGTH SIGLA $2 ESTADO $20 REGIAO $10;


 SELECT (sigla);
 WHEN ('RJ','SP','MG','ES') REGIAO = 'SUDESTE';
 WHEN ('RS','SC','PR') REGIAO = 'SUL';
 WHEN ('MA','PI','CE','RN','PB','PE','AL','SE')  REGIAO = 'NORDESTE';
 OTHERWISE REGIAO = "BAHIA";
 END;
 
 RUN;

DATA TEMPERATURAS_LENG;
SET temperaturas;

SELECT;
 WHEN (graus <= 20) CLASSE = 'FRIO';
 WHEN (graus > 20 AND GRAUS <=29) classe = 'AGRADÁVEL';
 WHEN (graus > 29 AND GRAUS <=34) classe = 'CALOR';
 OTHERWISE classe = 'CALOR ABSURDO';
 end;
 
 select;
 when (graus <= 20)   graus_10 =  graus + 10;
 when (graus <= 30)     graus_10 = graus - 10;
 otherwise graus_10 = 0;
 
 END;
 
 RUN;

/* SAS APOSTILA 2 COMANDO OUTPUT PAG 65 */


PROC PRINT DATA=UF;
RUN;

DATA OUTPUT;

 
X = 1 ; Y = 2 ; Z = X + Y  ;
OUTPUT;
X = 2 ; Y = 3 ; Z = X + Y;  K = 1;
OUTPUT;
RUN;

/* SAS APOSTILA 2 SAS BASE PAG 65 */

DATA SQRT;
SET OUTPUT;

RAIZ = SQRT(X);
RUN;

/* MAIS USADAS 

ABS(n) Retorna o valor absoluto de n. X=-9;  Y=ABS(X); *retorna 9;

 EXP(n) Retorna o valor da função exponencial. X1=0; 
 Y1=EXP(X1); *retorna 1;
 X2=1.0;
 Y2=EXP(X2); 
*retorna 2.7182818285;
 
INT(n)  Retorna a porção inteira de um número 
real.
 X1=2.1;
 Y1=INT(X1); *retorna 2;
 LOG(n)
 Retorna o logaritmo natural (base e.)
 X2=5.9;
 Y2=INT(X2); *retorna 5;
 X1=1.0;
 Y1=LOG(X1); *retorna 0;
 LOG10(n)
 Retorna o logaritmo na base 10.
 LOG2(n)
 Retorna o logaritmo na base 2.
 MAX(n1, …, nk) Retorna o maior valor entre k valores 
passados como argumento.
 MEAN(n1, …, nk) Retorna a média de k valores passados 
como argumento. Valores missing são 
ignorados.
 MIN(n1, …, nk)
 X2=10.0;
 Y2=LOG(X2); 
*retorna 2.302585093;
 X = 100;
 Y=LOG10(X); *retorna 2;
 X = 1024;
 Y=LOG2(X); *retorna 10;
 MAX(0, -1, 1); *retorna 1;
 MEAN(2, ., 1, 5); 
*retorna 2.66667;
 Retorna o menor valor entre k valores 
passados como argumento.
 MIN(0, -1, 1); *retorna -1;
 MOD(n,d)
 Retorna o resto da divisão de n por d.
 N(n1, …, nk)
 Retorna a quantidade valores diferentes
 de missing em uma lista.
 NMISS(n1, …, nk) Retorna a quantidade valores missing 
em uma lista
 ROUND(n, m)
 MOD(11,3); *retorna 2; 
N(2, ., 1, 5); *retorna 3;
 Arredonda n para o múltiplo mais 
próximo de m ou para o inteiro mais 
próximo caso m seja omitido.
 NMISS(2, ., 1, 5); 
*retorna 1;
 ROUND(9.8); *retorna 10;
 ROUND(5.1); *retorna 5;
 ROUND(1234.56,100);
 *retorna 1200;
 SIGN(n)
 Retorna o sinal de n ou zero.
 X1=-90;
 Y1=SIGN(X1); *retorna -1;
 SQRT(n)
 Retorna a raiz quadrada de n.
 SUM(n1, …, nk)
 Retorna a soma de k valores passados 
como argumento. Valores missing são 
ignorados.
 4.13.2 Funções para Conversão de Tipos
 X2=200;
 Y2=ABS(X2); *retorna 1;
 SQRT(9); *retorna 3;
 SUM(2, ., 1, 5); *retorna 8

  */

/* SAS APOSTILA 2 SAS PUT INPUT  67 */

DATA PUT_INPUT;

 
ANO_STR = '2025' ;
ANO_NR = INPUT(ANO_STR, 4.);
ANO_STR_NR = PUT(ANO_NR, $4.);
RUN;

/* SAS APOSTILA 2 SAS PROC STRING  68  */
/* funcoes */

/* COMPRESS 68 */

DATA COMPRESS_REMOVE_STRINGPUT_INPUT;

palavra = "abacaxi";

compress = compress(palavra , "ai");

time = "corinthians" ;

time2 = compress(time , "c" );

run;

/* FIND 68  */
/* RETORNA A POSICAO */

DATA FIND_POSICAO;

palavra = "renegade";

find_2 = find(palavra, "e");

find_0 = find(palavra, "x");

run;

DATA FIND_parametros;

palavra = "renegade";N

find_posicao = find(palavra, "e", 4);

find_ignorar_maiscu = find(palavra, "g", "i");

run;

/* LENGTHC - conta espaco  69 */

DATA LENGTHC_COMPRIMENTO_branco;

palavra = "    Cookie    ";

lenght = LENGTHC(palavra);

run;


/* LENGTH - sem contar espaco  69 */

DATA LENGTHN_COMPRIMENTO_branco;

LENGTH palavra $10;
palavra = '    Cookie    ';

lenght = LENGTHN(palavra);

run;

/* lowercase - maiusculos  69 */

data lowercase;

palavra = lowcase("COOKIE");

run;

/* propcase - primeira maiusculos  69 */

data propcase;

palavra = PROPCASE("cookie");

run;

/* scan - quebra string em partes de acordo com delimitador  69 */
/* trago a posicao e a partir de  */

data scan;

palavra = "cookie";

coo= scan(palavra, 1, "k");

kie= scan(palavra, 2 , "o");


run;

/* strip remove espaco em branco 69 */

data strip;

palavra = "   cookie    ";

strip = strip(palavra);

run;

/* substr - extrair a partir de posicao 69 */

data substr;

palavra = "cookie e tito";

cookie = substr(palavra, 1 , 6);

tito = substr(palavra, 10 , 4);

;run;


/* tranwrd substitui string 69  */


data TRANWRD;

palavra = "abacaxi";

abacate = TRANWRD(palavra, "xi", "te")
;
run;

DATA coalesce_missing;
 INPUT DIA GRAUS ;
 cards;
 10  99
 20  .
 ;
     run;
     
data coalesce_missing2;
set coalesce_missing;

graus1 = coalesce(graus, 10);

graus2 = missing(graus);
run;

/* variaveis datetime pag 70 */

data datas;
    infile datalines dlm=' ' truncover;
    input DIA :ddmmyy10. HORA :time11.;
    format DIA ddmmyy10. HORA time8.;
datalines;
01/01/2016 00:00:00
15/03/2016 19:30:04
05/04/2017 02:25:45
;
run;

proc print data=datas noobs;
run;


DATA TESTE;
SET DATAS;

DATAFINAL = DHMS(DIA, 0, 0, HORA);

RUN;
 
/* FUNCOES MANIP DATAS PAG 71 

today() data servidor date

*/

data data;
set datas;

hoje = today();
ontem = hoje - 1;
amanha = hoje + 1;
dia_nr = day(hoje);
mes = month(hoje);

ano = year(hoje);

datetime = datetime();

pdata = datepart(hoje);

hor = hour(datetime);
min = minute(datetime);
hor = second(datetime);

time = timepart(datetime);


format hoje ontem amanha pdata date9.
datetime datetime. hor time time8.;

run;

/*INTERVALO 73
DATDIF 
INTCK internvao de medida

  */
 
data intervalos;

d1 = '01jan2017'd;
d2 = '11jan2018'd;

d3 = datdif(d1, d2, 'actual');
d4 = datdif(d1, d2, '30');

d5 = intck('day', d1, d2);
d6 = intck('week', d1, d2);
d7 = intck('month', d1, d2);

format d1 d2 date9.;

run;

/* DO WHILE PAG 73 */



DATA PRIMOS ;
input n;
datalines;
10
2
13
100
9
41
1000
1013

;
run;

data do_while;
set primos;

PRIMO = "SIM";
i = 2;

raiz = round(sqrt(n));

do while ( i <= raiz);

if mod(n,i) = 0 then do;
PRIMO = "nao";
leave;
end; *{IF};

i = i + 1;
end; *{while};

RUN;

/* EXTRUTURA DO PAG 75 */

data do;
do n = 1 to 9 by 1;

do i = 2 to 9  by 1;
valor = n*1;

output;
end;
end;
run;

/* EXTRUTURA DO UNTIL PAG 76 */

DATA DO_UNTIL;

x = 1;

do until (x < 10);
output;

x = x + 1;
end;


run;


/* PROGRAM DATA VECTOR PDV 76*/
/* _N_  NR ITERACOES 
_ERROR_  ONDE OCORREU ERRO*/

DATA UF;
INFILE DATALINES DSD DLM=",";
INPUT X   Y  Z;
DATALINES;
2,9 ,3
5,10,5
20,3,6
A = X * Y + Z;
;



RUN;

DATA DUMMY;
SET UF;
INPUT X Y;

Z = X * Y ;

RUN;

/* INTRODUCAO PROC 81 */

/* DATA = ATRIBUIU UMA TABELA */

PROC PRINT DATA = UF;RUN;

PROC PRINT ;RUN; 
/* ULTIMA TABELA GERADA */

/* SORT ORDENAR*/
/* MERGE E MODIFY DEVEM SER ORDENADOS */

PROC SORT DATA = UF;
BY X;
RUN;

PROC SORT DATA = UF OUT= UF_SORT;
BY X Y;
RUN;

/* NODUPKEY DUPLICADOS */

PROC SORT DATA = UF OUT= UF_SORT NODUPKEY;
BY  X DESCENDING Y ;
RUN;

/* PROC PRINT 85*/

PROC PRINT DATA= UF;RUN;

/* PROC PRINT VAR ESCOLHE A VARIAVEL 86*/

PROC PRINT DATA=UF;
VAR Y ;
RUN;

/* Comandos NOOBS e N REMOVE COLUNA OBS 87  */
/* n TOTAL DE LINHAS */

PROC PRINT DATA= UF NOOBS N;
VAR X;
RUN;

/* COMANDO BY PAG 87 */

proc sort data=uf;
 by x;
 run;

proc print data=uf noobs;
by x;
run;



/* COMANDO SUM PAG 88 */
/* SOMATORIA DE UMA VARIAVEL */

PROC SORT DATA=UF; BY x;RUN;

proc print data = uf noobs;
by x;
sum y;
run;



/* COMANDO WHERE PAG 88 */
 
PROC PRINT DATA=UF NOOBS;
VAR X Y Z;
WHERE X = 2;
RUN;


/* COMANDO ID PAG 89 */
/* USAR COMO CHAVE */

PROC PRINT DATA=UF;
ID X;
RUN;

/* COMANDO TITLE PAG 89 */
/* TITULO NO RELATORIO */

proc print data=uf;
title 'TITULO';
ID Y;
RUN;

TITLE;



/* COMANDO FREQ PAG 90 */

DATA BRINQUEDOS;
LENGTH NOME $ 30. FABRICANTE $ 30. IDADE 3.;
INFILE DATALINES DLM=',';
INPUT NOME $ FABRICANTE $ IDADE;
DATALINES;
BONECA,GAUSSIAN,5
QUEBRA, GAUSSIAN,7
KIT, PROBA, 5
GAME, GAUSSIAN, 7
KIT2, PROBA, 10
URSO,PROBA, 5
LIVRO,GAUSSIAN, 10
;
RUN;

/* FABRICANTE */
PROC FREQ DATA=BRINQUEDOS;
TABLES FABRICANTE ;
TITLE 'FABRICANTE';
RUN;

/* FABRICANTE */
PROC FREQ DATA=BRINQUEDOS;
TABLE FABRICANTE ;
TITLE 'FABRICANTE TABLE';
RUN;
/* SEM TABLE */
PROC FREQ DATA=BRINQUEDOS;
TITLE 'FABRICANTE SEM TABLE';
RUN;

/* CRUZADA BI DIMENSIONAL*/
PROC FREQ DATA=BRINQUEDOS;
TABLES FABRICANTE * IDADE;
TITLE 'CRUZADA ENTRE FABRICANTE E IDADE';
RUN;

/* COMANDOS ADICIONAIS TABLE 
 Opções do Comando TABLES
 Existe uma variedade de opções que podem ser utilizadas junto ao comando
 TABLES:
  BY: computa uma tabela de frequência distinta para cada BY Variable.
  MISSING: trata o valor missing como uma categoria (possível valor) da variável de
 tabulação.
  NOROW, NOCOL, NOPERCENT podem ser utilizadas para suprimir,
 respectivamente, as estatísticas por linha, coluna e as frequências relativas. 
 OUT: possibilita a geração de um data set contendo a frequência e a frequência
 relativa da(s) variável(is) especificadas no comando TABLES. 
 WEIGHT: permite especificar uma variável que armazene o peso associado a cada
 observação, caso a mesma exista no data set
  */



/* 09 SAS COMANDO TABLES PAG 93 

opcoes 
BY: computa uma tabela de frequência distinta para cada BY Variable.
 MISSING: trata o valor missing como uma categoria (possível valor) da variável de
tabulação.
 NOROW, NOCOL, NOPERCENT podem ser utilizadas para suprimir,
respectivamente, as estatísticas por linha, coluna e as frequências relativas.
 OUT: possibilita a geração de um data set contendo a frequência e a frequência
relativa da(s) variável(is) especificadas no comando TABLES.
 WEIGHT: permite especificar uma variável que armazene o peso associado a cada
observação, caso a mesma exista no data set
*/

proc freq
data = brinquedos;
run;

table e out;

proc freq
data = brinquedos;
tables fabricante /nopercent out= freq_brinc;
run;

proc print data=freq_brinc; run;

//duas variaveis//;

proc freq data = brinquedos;
tables fabricante;
tables fabricante * idade;
run;

ORDER;
 data: ordena os valores de acordo com a sua posição no data set.
 formatted: ordena os valores de acordo com os seus formatos (veja a seção 4.6).
 freq: ordena pela frequência, de forma descendente
;

PROC FREQ DATA = BRINQUEDOS
ORDER = FREQ;
TABLES IDADE;
RUN;

PROC FREQ DATA = BRINQUEDOS
ORDER = data;
TABLES IDADE;
RUN;

OPCOES ESTATISTICAS
;
PROC FREQ
DATA = BRINQUEDOS;
TABLES FABRICANTE * IDADE /CHISQ;RUN;


FREQ + FORMAT/?
CRIA CATEGORIAS ATRAVES DOS NUMEROS;

PROC FORMAT;
VALUE IDADE_FMT 0-5 = "<6"
                5-8 = "6-8"
                9-HIGH = ">8"
                ;RUN;


PROC PRINT DATA=BRINQUEDOS;RUN;

PROC FREQ DATA = BRINQUEDOS;
TABLE IDADE;
FORMAT IDADE IDADE_FMT.;
RUN;


data teste; set freq_brinc; run;

/*PROC MEANS PAG 96*/
/* mean var sd  */

/* N: número de valores não-missing. */
/*  NMISS: número de valores missing. */
/*  SUM: somatório. */
/*  MIN: valor mínimo. */
/*  MAX: valor máximo. */
/*  MEAN: média . */
/*  STD: desvio padrão. */
/*  VAR: variância. */

proc contents data= alura.exemplo_teste; run;

proc print data=alura.exemplo_teste; run;

proc sort data=alura.exemplo_teste (keep=nome preco) ; by nome; run;


proc means  data=alura.exemplo_teste n mean min max sum;
by nome ;
var preco ;
title "proc means";
output out = teste;

run;

proc means  data=alura.exemplo_teste;
by nome ;
var preco ;
title "proc means";
output out = teste;

run;
proc means  data=alura.exemplo_teste;
/* by nome ; */
/* var preco ; */
title "proc means";
output out = teste;

run;

proc means  data=alura.exemplo_teste;
by nome ;
var preco ;
title "proc means";
output out = com_sum
sum(preco) = sum_pre
mean(preco) = mean_preco;

run;

/*PROC TABULATE PAG 99*/

/* melhores tabulacoes que freq print e means */

data impressoras;
input modelo $ cor tipo $ preco $;
datalines;
I001 1 ink-jet >200
I002 0 laser   100-200
I003 0 ink-jet 100-200
I004 1 ink-jet 100-200
I005 0 laser   >200
I006 1 ink-jet 100-200
I007 1 laser   >200
I008 0 ink-jet 100-200
I009 0 ink-jet 100-200
I010 1 laser   >200
;
run;



proc tabulate 
data = impressoras
out = teste; ;
class cor tipo preco;
table cor, tipo, preco;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class modelo cor tipo preco;
table modelo cor tipo preco;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class modelo cor tipo preco;
table cor tipo;
title 'total de impressoras'
;run;

/* estatisticas adicionais

 ALL: adiciona um total por página, linha ou coluna aos resultados.
 N: número de valores não-missing.
 NMISS: número de valores missing.
 SUM: somatório.
 MIN: valor mínimo.
 MAX: valor máximo.
 MEAN: média aritmética.
 STDDEV: desvio padrão
*/

proc tabulate 
data = impressoras
out = teste; ;
class modelo cor tipo preco;
table cor all tipo all preco all;
title 'total de impressoras'
;run;

/* concatenando */



proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo preco;
table cor * tipo;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo preco;
table (preco tipo) * cor;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo preco;
table (preco tipo) * (cor preco);
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo modelo preco ;
table  preco all, tipo all ;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo modelo preco ;
table  (preco  * tipo) all  ;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo  preco ;
table preco, cor, tipo  ;
title 'total de impressoras'
;run;



proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo  preco ;
table preco * cor * tipo  ;
title 'total de impressoras'
;run;

proc tabulate 
data = impressoras
out = teste; ;
class  cor tipo  preco ;
table tipo * preco * cor all ;
title 'total de impressoras'
;run;
/* proc corr 102 

medir a relacao entre duas variaveis

*/

DATA PROC_CORR;
INFILE DATALINES DLM=' ';
INPUT ID $ ALTURA PESO;
DATALINES;
A1 49 81
A2 50 88
A3 53 87
A4 55 99
A5 60 91
A6 55 89
A7 60 95
A8 50 90
;
RUN;

/*coeficiente de pearson*/

PROC CORR DATA=proc_corr;
VAR ALTURA ; 
With peso;
run;

/*PROC REPORT PAG 104

PRODUCAO DE RELATORIOS
*/
DATA Paises;
INPUT sigla $ nome $ continente $ extensao populacao;
DATALINES;
BRA Brasil A 8515767 204450649
CUB Cuba A 109890 11389562
FRA França E 549190 64395345
HUN Hungria E 93030 9855023
ITA Itália E 301340 59797685
MEX México A 1964380 127017224
NOR Noruega E 323780 5210967
PER Peru A 1285220 31376670
PRT Portugal E 92090 10349803
URY Uruguai A 176220 3431555
;
RUN;

PROC REPORT DATA=PAISES;
COLUMN SIGLA EXTENSAO;
RUN;

PROC REPORT DATA=PAISES;
COLUMN nome populacao;
RUN;

/*DEFINE 105*/

PROC REPORT DATA=PAISES OUT=TESTE (DROP=_BREAK_);
COLUMN nome populacao;
DEFINE continente / ORDER;

RUN;

/*USANDO GROUP */

PROC REPORT DATA=PAISES OUT= GROUP (DROP=_BREAK_);
COLUMN CONTINENTE EXTENSAO;
DEFINE continente / GROUP;

RUN;

/*ACRROS PARA CONTAGEM DE FREQUENCIA*/

PROC REPORT DATA=PAISES OUT=TESTE (DROP=_BREAK_);
COLUMN CONTINENTE;
DEFINE continente / ACROSS;

RUN;

DATA Paises2;
INPUT sigla $ continente $ extensao populacao;
DATALINES;
BRA  A 8515767 204450649
CUB  A 109890 11389562
BRA  E 549190 64395345
HUN  E 93030 9855023
BRA  E 301340 59797685
MEX  A 1964380 127017224
CUB  E 323780 5210967
HUN  A 1285220 31376670
HUN  E 92090 10349803
URY  A 176220 3431555
;
RUN;

PROC REPORT DATA=PAISES2 OUT= GROUP (DROP=_BREAK_);
COLUMN SIGLA POPULACAO;
DEFINE SIGLA / GROUP;

RUN;

PROC SQL; CREATE TABLE TESTE AS 
SELECT SIGLA,
SUM(POPULACAO) AS POPULACAO

FROM PAISES2
GROUP BY 1;
QUIT;

/*BREAK

5.10.2 Comando BREAK
92090
Este comando é utilizado para a definição de quebras de seção em um relatório. O
comando funciona adicionando uma quebra para cada valor único de uma variável
especificada. É possível também definir uma ou mais “opções de quebra”:
 OL: desenha uma linha após a quebra;
 UL: desenha uma linha antes da quebra;
 PAGE: pula uma página;
 SKIP: insere uma linha em branco.
 SUMMARIZE: insere uma linha com o somatório das variáveis numéricas

*/

PROC REPORT  DATA=PAISES OUT= GROUP (DROP=_BREAK_);
COLUMN CONTINENTE EXTENSAO;
DEFINE continente / ORDER;
BREAK AFTER CONTINENTE / OL SUMMARIZE;

RUN;

/*DEFINE 105*/

PROC REPORT DATA = PAISES;
COLUMN SIGLA CONTINENTE ;
DEFINE CONTINENTE / ORDER;
RUN;

 

PROC REPORT DATA = PAISES;
COLUMN  CONTINENTE EXTENSAO ;
DEFINE CONTINENTE / GROUP;
RUN;

/* ACROSS CONTAGEM DE FREQ */

PROC REPORT DATA=PAISES;
COLUMN CONTINENTE;
DEFINE CONTINENTE / ACROSS;
RUN;

/* MUDANCA DE CABECALHO */

PROC REPORT DATA=PAISES;
COLUMN SIGLA CONTINENTE EXTENSAO;
DEFINE SIGLA / "SIGLA PAIS";
DEFINE CONTINENTE /ORDER "CONT.PAIS";
DEFINE EXTENSAO / "EST TERR";
RUN;

/* BREAK 

 OL: desenha uma linha após a quebra;
 UL: desenha uma linha antes da quebra;
 PAGE: pula uma página;
 SKIP: insere uma linha em branco.
 SUMMARIZE: insere uma linha com o somatório das variáveis numéricas
*/

PROC REPORT DATA = PAISES;
COLUMN CONTINENTE SIGLA NOME EXTENSAO POPULACAO;
DEFINE CONTINENTE / ORDER ;
BREAK AFTER CONTINENTE / OL SUMMARIZE;
RUN;

/* ODS DEFINIR FORMATO DE SAIDA*/

PROC PRINT DATA=PAISES;
RUN;

ods _all_ close;

ods pdf file=paises;

/*TRANSPOSE 109*/

PROC REPORT DATA=PAISES OUT=TRANSPOSE (DROP=_BREAK_);
COLUMN SIGLA CONTINENTE;
DEFINE CONTINENTE /ORDER;
RUN;

PROC SORT DATA=TRANSPOSE; BY CONTINENTE  SIGLA ; RUN;

PROC TRANSPOSE DATA=TRANSPOSE  OUT= DATA_TRANSPOSE PREFIX = VER;
VAR SIGLA ;
BY CONTINENTE;
RUN;

PROC SORT DATA = Paises; by nome SIGLA; run;

proc transpose data = paises 
out = total prefix = dados;
var extensao populacao;
by nome;
run;

proc transpose data = total 
out = total2 Prefix = dados;
var dados1;
by nome;
run;
 
 
PROC TRANSPOSE DATA = PAISES
OUT = TOTAL3 PREFIX = CONTINENTE;
VAR CONTINENTE;
BY SIGLA;
RUN;
 
 /*PAG 111 APPEND
 somente2em 2  */ 
 data vendas1;
 input produto $ mes $ quant;
 datalines;
cafe jan 1200
suco jan 350
cha jan 245
 ;
 run;
 
 data vendas2; 
 input produto $ mes $ quant;
 datalines;
 cafe fev 1512
 suco fev 487
 chav fev 300
 guarana fev 408
 ; run;
 
 proc append base=vendas1
 data = vendas2 
 out=teste1;
 run;
 
 /*pg113 concatena com see*/

data vendas;
set vendas1 vendas2;
run;
 
/*  pag 114 proc compare */

data pesq2026;
input id cnpj po;
datalines;
1 1234 1
;

data pesq2027;
input id cnpj po;
datalines;
2 3524 2
;

/* precisa ser ordenado pela chave */

proc sort data=pesq2026;
by cnpj;
run;

proc sort data=pesq2027;
by cnpj;
run;


proc compare base = pesq2026
compare = pesq2027;
id cnpj;
run;
 
/* PROC CONTENTS PAG 117  */

PROC CONTENTS DATA=PESQ2026;RUN;

/* 6.1 SET PAG 119*/
 
 
PROC DATASETS KILL;RUN;

/*
5.11 Introdução à Tecnologia ODS – Output Delivery System 108
*/
 

 