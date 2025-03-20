/* Conectar ao CAS; */
cas casconexao;
caslib _all_ assign;
options casdatalimit=3000M;

/* Parâmetros para pesquisa */
/* %let cpf = 12000759785; */

/* Criar tabela com Score */
proc sql;
	create table pessoa as
	select distinct
		ft.ID_ENVOLVIDO as idenvolvido,
		ft.IM_FOTO as foto,
		ft.NM_COMPL_ENVOL as nome,
		ft.ID_IDADE_APROX as idade,
		ft.ID_SEXO as sexo,
		ft.NM_MAE as mae,
		ft.NM_PAI as pai,
		catx(', ', ft.DS_LOGRADOURO, ft.NR_NUMERO, ft.NM_BAIRRO, ft.NM_MUNICIPIO, ft.CD_UF) as endereco,
		ft.DS_APELIDO as apelido,
		catx('-', ft.ID_DOC_IDENTID, ft.ID_ORG_EXPED) as rg,
		ft.NR_CPF as cpf
	from PUBLIC._FOTOS ft;
quit;

/* Pesquisa por filtro */
proc sql;
	create table resultado as
	select *
	from pessoa
	where 1=1

  /* Parâmetros no WHERE */
  %if %sysevalf(%superq(cpf) ne, boolean) %then %do;
    and cpf = &cpf
  %end;
  ;
quit;

/* Exportando arquivo como JSON */
proc json out=_webout nosastags pretty;
  export resultado;
run;