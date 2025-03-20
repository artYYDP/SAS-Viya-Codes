/* Defina as variáveis da macro */
%let incaslib = BRONZE; /* Biblioteca CAS onde se encontra a tabela para o promote */
%let casdata = EBOPT_BOP_ENV_OCORR_FOTO_DEON_TESTE; /* Nome da tabela CAS que você fará o promote */
%let casout = EBOPT_BOP_FOTO; /* Nome da tabela que você deseja colocar no CAS */

/* Macro para carregar e promover uma tabela no ambiente CAS */
%macro sas_load_promote_cas(casout=, incaslib=, casdata=);

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
%mend sas_load_promote_cas;

/* Chamar a macro com as variáveis definidas */
%sas_load_promote_cas(casout=&casout, incaslib=&incaslib, casdata=&casdata);

/* id_peculiaridade_envol_foto = 38450 */

proc sql;
	create table temp as
	select
		id_peculiaridade_envol_foto,
		id_peculiaridade,
		im_thumbnail_base64
	from BRONZE.EBOPT_BOP_FOTO
	where id_peculiaridade_envol_foto = 38450;
quit;

