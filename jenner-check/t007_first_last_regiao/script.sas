data FIRST_LAST;
LENGTH CIDADE $ 30;
INPUT CIDADE $ REGIAO $ populacao;
DATALINES;
Belém          Sudeste 1446042
Belo     		 Sudeste 2513451
Boa       		Norte   326419
Curitiba       	Sul     1893977
Florianópolis  	Sul     477798
Macapá         	Norte   465495
Manaus         	Norte   2094391
Palmas         	Norte   279856
Porto          	Sul     1481019
Porto     		Norte   511219
Rio      		Norte   377057
São      		 Sudeste 12038175
Rio   			Sudeste 6498837
Vitória        Sudeste 359555
;
run;

/*FUNCIONA COM SORT*/

proc sort data=first_last;
by regiao;
run;

data pop_regiao (keep=regiao populacao);
set first_last; 
by regiao;
retain populacao;

if first.regiao then populacao = 0;

pop_total = pop_total + populacao;

if last.regiao then output;


run;

proc print data=pop_regiao; run;
