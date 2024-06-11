/* CÓDIGO PARA CARREGAR TABELA DA WORK E PROMOVER NO CAS */
/* Versão: 1.0 */
/* Status: Finalizado */
/* Autor: Geiziane Silva de Oliveira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Defina as variáveis da macro */
%let incaslib = ; /* Biblioteca CAS de entrada */
%let casdata = ; /* Nome da tabela CAS de entrada e saída */
%let data = ; /* Nome da tabela SAS a ser carregada */
%let outcaslib = ; /* Biblioteca CAS de saída */
%let casout = ; /* Nome da tabela CAS de saída */

/* Macro para Carregar Dados no CAS e Promover a Tabela */
%macro sas_load_data_cas(incaslib=,casdata=,data=,outcaslib=, casout=);

/* Deleta a tabela da memória */
proc casutil;
  droptable incaslib = "&outcaslib." casdata = "&casdata." quiet;
run;

/* Carrega tabela no CAS*/
proc casutil;
  load data=&data. casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* Promove a tabela (disponível para todos os usuário acesso ao servidor) */
proc casutil;
  promote incaslib = "&outcaslib." casdata = "&casdata."
  outcaslib = "&outcaslib." casout = "&casout.";
quit;
%mend sas_load_data_cas;

/* Chamar a macro com as variáveis definidas */
%sas_load_data_cas(incaslib=&incaslib, casdata=&casdata, data=&data, outcaslib=&outcaslib, casout=&casout)