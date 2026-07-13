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

proc print data=do_while; run;
