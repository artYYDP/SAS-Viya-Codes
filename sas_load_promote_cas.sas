/* CÓDIGO PARA ATUALIZAR TABELA DO CAS */
/* Versão: 1.0 */
/* Status: Finalizado */
/* Autor: Arthur Diego Pereira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Defina as variáveis da macro */
%let incaslib = ; /* Biblioteca CAS de entrada */
%let casdata = ; /* Nome da tabela CAS de entrada e saída */

/* Dropa a tabela no CASLIB, carrega a tabela para o code */
proc casutil;
	droptable incaslib="&incaslib." casdata="&casdata." quiet;
	load casdata="&casdata." incaslib="&incaslib."
	outcaslib="&incaslib." casout="&casdata.";
run;

/* Promove a tabela para a CASLIB */
proc casutil;
	promote incaslib="&incaslib." casdata="&casdata."
	outcaslib="&incaslib." casout="&casdata.";
quit;