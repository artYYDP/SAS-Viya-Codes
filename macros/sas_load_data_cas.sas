/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  CÓDIGO PARA CARREGAR TABELA DA WORK E PROMOVER NO CAS  ║ */
/* ║---------------------------------------------------------║ */
/* ║  Versão: 1.5                                            ║ */
/* ║  Autor: Geiziane Silva de Oliveira                      ║ */
/* ║  Alterado por: Arthur Diego Pereira                     ║ */
/* ║                                                         ║ */
/* ║  FAVOR NÃO REMOVER OS CRÉDITOS                          ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
%macro sas_load_data_cas(caslib=, casdata=, outcaslib=, casout=);

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  DELETA A TABELA DA MEMÓRIA                             ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  droptable incaslib="&outcaslib." casdata="&casdata." quiet;
run;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  CARREGA TABELA NO CAS                                  ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  load casdata="&casdata..sashdat" incaslib="&caslib." casout="&casout." outcaslib="&outcaslib." promote;
quit;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  PROMOVE A TABELA                                       ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
  promote incaslib="&outcaslib." casdata="&casout."
  outcaslib="&outcaslib." casout="&casout.";
quit;
%mend sas_load_data_cas;