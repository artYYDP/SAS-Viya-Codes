/* ╔═════════════════════════════════════════════════════════╗ */
/* ║           CÓDIGO PARA ATUALIZAR TABELA DO CAS           ║ */
/* ║---------------------------------------------------------║ */
/* ║  Versão: 1.3                                            ║ */
/* ║  Autor: Arthur Diego Pereira                            ║ */
/* ║                                                         ║ */
/* ║  FAVOR NÃO REMOVER OS CRÉDITOS                          ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
%macro sas_load_promote_cas(incaslib=, casdata=);

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  CONECTA NO CAS                                         ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
cas casauto;
caslib _all_ assign;
options casdatalimit=all mprint;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  DROPA A TABELA NO CASLIB E CARREGA A TABELA PARA O CAS ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
	droptable incaslib="&incaslib." casdata="&casdata." quiet;
	load casdata="&casdata." incaslib="&incaslib."
	outcaslib="&incaslib." casout="&casdata.";
run;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  PROMOVE A TABELA                                       ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
proc casutil;
	promote incaslib="&incaslib." casdata="&casdata."
	outcaslib="&incaslib." casout="&casdata.";
quit;

/* ╔═════════════════════════════════════════════════════════╗ */
/* ║  DESCONECTA DO CAS                                      ║ */
/* ╚═════════════════════════════════════════════════════════╝ */
cas casauto terminate;

%mend sas_load_promote_cas;