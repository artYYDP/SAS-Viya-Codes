/* Defina as variáveis da macro */
%let incaslib = ; /* Biblioteca CAS onde se encontra a tabela */
%let casdata = ; /* Nome da tabela CAS que você deseja mudar o nome */
%let casout = ; /* Nome da tabela que você deseja colocar no CAS */

/* Macro para carregar e promover uma tabela no ambiente CAS */
%macro sas_change_table_name_cas(casout=, incaslib=, casdata=);

/* Dropa a tabela no CASLIB e carrega a tabela para o CAS */
proc casutil;
	droptable incaslib="&incaslib." casdata="&casdata." quiet;
	load casdata="&casdata." incaslib="&incaslib."
	outcaslib="&incaslib." casout="&casout.";
run;

/* Promove a tabela para o CASLIB */
proc casutil;
	promote incaslib="&incaslib." casdata="&casout."
	outcaslib="&incaslib." casout="&casout.";
quit;
%mend sas_change_table_name_cas;

/* Chamar a macro com as variáveis definidas */
%sas_change_table_name_cas(casout=&casout, incaslib=&incaslib, casdata=&casdata);