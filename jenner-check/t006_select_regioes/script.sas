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

PROC PRINT DATA=UF;
RUN;
