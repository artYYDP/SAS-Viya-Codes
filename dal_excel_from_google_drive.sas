/* CÓDIGO PARA BAIXAR E CARREGAR PLANILHA XLSX PÚBLICA DO GOOGLE DRIVE */
/* Versão: 1.3 */
/* Autor: Arthur Diego Pereira */
/*  */
/* FAVOR NÃO REMOVER OS CRÉDITOS */
/*  */

/* Definir as informações da Planilha compartilhada */
%let localxlsx = /local/nome_do_arquivo.xlsx; /* Define o local e o nome do arquivo onde o arquivo Excel será salvo */
%let filexlsx = planilha_excel; /* Define o nome do arquivo */
/* Coloque aqui somente o link do arquivo compartilhado */
/* Lembrando que o link deve ser compartilhado públicamente */
/* Exemplo: https://drive.google.com/file/d/1cVzWF8zJ5nd-6w-76RGNEOX6HSFuewAx/view?usp=drive_link */
/* Pegue somente o código '1cVzWF8zJ5nd-6w-76RGNEOX6HSFuewAx' sem aspas simples */
%let sharedurl = 1cVzWF8zJ5nd-6w-76RGNEOX6HSFuewAx; 
%let libxlsx = myxlsx; /* Dê um nome para a Libname que lerá o arquivo XLSX */
%let tabxlsx = Plan1; /* É necessário que você coloque o nome da Guia do Excel */
%let data = table_SAS; /* Dê um nome para a tabela no SAS */

/* Macro para baixar e carregar planilha do Excel (XLSX) do Google Drive */
%macro dal_excel_from_google_drive(localxlsx=, filexlsx=, sharedurl=, libxlsx=, tabxlsx=, data=);

/* Definir o local onde salvar o arquivo baixado */
filename &filexlsx. "&localxlsx.";

/* Fazer o Download do Arquivo Excel do Google Drive */
proc http
    url="https://drive.google.com/uc?export=download&id=&sharedurl."
    method="GET"
    out=&filexlsx.;
run;

/* Criar libname para o arquivo XLSX baixado */
libname &libxlsx. XLSX "&localxlsx.";

/* Copiar dados da planilha Excel para uma tabela SAS */
data &data.;
    set &libxlsx..&tabxlsx.;
run;

%mend dal_excel_from_google_drive;

/* Chamar a macro com os parâmetros desejados */
%dal_excel_from_google_drive(localxlsx=&localxlsx, filexlsx=&filexlsx, sharedurl=&sharedurl, libxlsx=&libxlsx, tabxlsx=&tabxlsx, data=&data);