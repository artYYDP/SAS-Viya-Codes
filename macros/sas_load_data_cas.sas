/* CÓDIGO PARA CARREGAR TABELA DA WORK E PROMOVER NO CAS */
/* Versão: 1.4 */
/* Autor: Geiziane Silva de Oliveira */
/* Alterado por: Arthur Diego Pereira */
/* Última alteração: 17/06/2024 19:06 */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Defina as variáveis da macro */
%let casdata = ; /* Nome da tabela no servidor CAS que será carregada e promovida */
%let data = ; /* Nome da tabela SAS que será carregada no servidor CAS */
%let outcaslib = ; /* Biblioteca CAS onde a tabela será armazenada após ser carregada */
%let casout = ; /* Nome da tabela no servidor CAS após ter sido carregada */

/* Macro para Carregar Dados no CAS e Promover a Tabela */
%macro sas_load_data_cas(data=,outcaslib=, casout=);

/* Deleta a tabela da memória */
proc casutil;
  droptable incaslib = "&outcaslib." casdata = "&casout." quiet;
run;

/* Carrega tabela no CAS*/
proc casutil;
  load data=&data. casout="&casout." outcaslib=&outcaslib. replace;
quit;

/* Promove a tabela (disponível para todos os usuário acesso ao servidor) */
proc casutil;
  promote incaslib = "&outcaslib." casdata = "&casout."
  outcaslib = "&outcaslib." casout = "&casout.";
quit;
%mend sas_load_data_cas;

/* Chamar a macro com as variáveis definidas */
%sas_load_data_cas(data=&data, outcaslib=&outcaslib, casout=&casout)