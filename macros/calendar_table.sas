/* ╔════════════════════════════════════════════════════╗ */
/* ║      CÓDIGO PARA CRIAR UMA TABELA CALENDÁRIO       ║ */
/* ║----------------------------------------------------║ */
/* ║  Versão: 1.3                                       ║ */
/* ║  Autor: Arthur Diego Pereira                       ║ */
/* ║                                                    ║ */
/* ║  FAVOR NÃO REMOVER OS CRÉDITOS                     ║ */
/* ╚════════════════════════════════════════════════════╝ */

/* ╔════════════════════════════════════════════════════╗ */
/* ║  CRIAÇÃO DA TABELA CALENDÁRIO                      ║ */
/* ╚════════════════════════════════════════════════════╝ */
%macro calendar_table(start_date=, outcaslib=, casout=);
  %let start=%sysfunc(inputn(&start_date., date9.));
  %let end=%sysfunc(today());
  %let n_days=%sysfunc(intck(day, &start., &end.));

  /* ╔════════════════════════════════════════════════════╗ */
  /* ║  CRIAÇÃO DA TABELA CALENDÁRIO TEMPORÁRIA NA WORK   ║ */
  /* ╚════════════════════════════════════════════════════╝ */
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
      Dia = day(Data);
      DiadaSemana = weekday(Data);

      if Mes <= 3 then Trimestre = 1;
      else if Mes <= 6 then Trimestre = 2;
      else if Mes <= 9 then Trimestre = 3;
      else Trimestre = 4;

      output;
    end;
  run;

  /* ╔════════════════════════════════════════════════════╗ */
  /* ║  REMOVE A TABELA SE JÁ EXISTIR NO CAS              ║ */
  /* ╚════════════════════════════════════════════════════╝ */
  proc casutil;
    droptable incaslib = "&outcaslib." casdata = "&casout." quiet;
  run;

  /* ╔════════════════════════════════════════════════════╗ */
  /* ║  CARREGA A TABELA NO CAS                           ║ */
  /* ╚════════════════════════════════════════════════════╝ */
  proc casutil;
    load data=calendario casout="&casout." outcaslib=&outcaslib. replace;
  quit;

  /* ╔════════════════════════════════════════════════════╗ */
  /* ║  PROMOVE A TABELA PARA O SERVIDOR CAS              ║ */
  /* ╚════════════════════════════════════════════════════╝ */
  proc casutil;
    promote incaslib = "&outcaslib." casdata = "&casout."
    outcaslib = "&outcaslib." casout = "&casout.";
  quit;

%mend;