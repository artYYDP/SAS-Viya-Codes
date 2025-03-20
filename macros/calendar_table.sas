/* CÓDIGO PARA CRIAR UMA TABELA CALENDÁRIO NO SAS */
/* Versão: 1.3 */
/* Autor: Arthur Diego Pereira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Macro que cria a Tabela Calendário */
%macro calendar_table(start_date=, outcaslib=, casout=);
%let start=%sysfunc(inputn(&start_date., date9.));
%let end=%sysfunc(today());
%let n_days=%sysfunc(intck(day, &start., &end.));

data work.calendario(rename=(
    date=Data
    year=Ano
    quarter=Trimestre
    month=Mes
    day=Dia
    weekday=DiadaSemana
    i=id
  ));
  retain Data Ano Trimestre Mes Dia DiadaSemana id;
  format Data date9.;

  do id=0 to &n_days;
    Data = intnx('day', &start., id);
    Ano = year(Data);
    Mes = month(Data);
    Dia = day(data);
    DiadaSemana = weekday(Data);

    if Mes <= 3 then Trimestre = 1;
    else if Mes <= 6 then Trimestre = 2;
    else if Mes <= 9 then Trimestre = 3;
    else Trimestre = 4;

    output;
  end;
run;

/* Deleta a tabela da memória */
proc casutil;
  droptable incaslib = "&outcaslib." casdata = "&casout." quiet;
run;

/* Carrega tabela no CAS*/
proc casutil;
  load data=calendario casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* Promove a tabela (disponível para todos os usuário acesso ao servidor) */
proc casutil;
  promote incaslib = "&outcaslib." casdata = "&casout."
  outcaslib = "&outcaslib." casout = "&casout.";
quit;

%mend;