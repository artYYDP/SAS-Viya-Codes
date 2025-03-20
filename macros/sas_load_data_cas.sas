/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  CÓDIGO PARA CARREGAR TABELA DA WORK E PROMOVER NO CAS  ║ */
/* ║---------------------------------------------------------║ */
/* ║  Versão: 1.5                                            ║ */
/* ║  Autor: Geiziane Silva de Oliveira                      ║ */
/* ║  Alterado por: Arthur Diego Pereira                     ║ */
/* ║                                                         ║ */
/* ║  FAVOR NÃO REMOVER OS CRÉDITOS                          ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
%macro sas_load_data_cas(data=,outcaslib=, casout=);

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  DELETA A TABELA DA MEMÓRIA                             ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  droptable incaslib = "&outcaslib." casdata = "&casout." quiet;
run;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  CARREGA TABELA NO CAS                                  ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  load data=&data. casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  PROMOVE A TABELA                                       ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  promote incaslib = "&outcaslib." casdata = "&casout."
  outcaslib = "&outcaslib." casout = "&casout.";
quit;
%mend sas_load_data_cas;