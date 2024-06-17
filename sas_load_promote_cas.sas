/* CÓDIGO PARA ATUALIZAR TABELA DO CAS */
/* Versão: 1.2 */
/* Autor: Arthur Diego Pereira */
/* Alterado por: -- */
/* Última alteração: -- */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Defina as variáveis da macro */
%let incaslib = ; /* Biblioteca CAS onde se encontra a tabela para o promote */
%let casdata = ; /* Nome da tabela CAS que você fará o promote */

/* Macro para carregar e promover uma tabela no ambiente CAS */
%macro sas_load_promote_cas(incaslib=, casdata=);

/* Dropa a tabela no CASLIB e carrega a tabela para o CAS */
proc casutil;
	droptable incaslib="&incaslib." casdata="&casdata." quiet;
	load casdata="&casdata." incaslib="&incaslib."
	outcaslib="&incaslib." casout="&casdata.";
run;

/* Promove a tabela para o CASLIB */
proc casutil;
	promote incaslib="&incaslib." casdata="&casdata."
	outcaslib="&incaslib." casout="&casdata.";
quit;
%mend sas_load_promote_cas;

/* Chamar a macro com as variáveis definidas */
%sas_load_promote_cas(incaslib=&incaslib, casdata=&casdata);