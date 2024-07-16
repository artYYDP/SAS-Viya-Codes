# ⌨️ SAS Viya Codes

Compilado de Códigos SAS para facilitar a vida de qualquer um.

## 👨‍💻 Uso no SAS Visual Analytics (VA)

Esses repositório tem como função ajudar os programadores e analistas SAS a execução do Mapa Coroplético de um maneira simples e rápida, que possa ser replicada em vários projetos.

> [!CAUTION]
> Não me responsabilizo pelo uso indevido do código.

## 📖 Catálogo de Códigos

1. [Carregar tabela da work e promover no CAS](/sas_load_data_cas.sas)

Essa macro %sas_load_data_cas é uma ferramenta útil para automatizar o processo de deletar uma tabela existente da memória CAS, carregar uma nova tabela do SAS para o CAS e promover essa tabela para que fique disponível a todos os usuários do servidor.

2. [Atualizar tabela do CAS](/sas_load_promote_cas.sas)

Essa macro %sas_load_promote_cas faz com que a tabela do CAS seja atualizada com novas informações. É uma macro excelente para caso você precise atualizar as tabelas diariamente de um DataLake, por exemplo.

3. [Baixar e carregar planilha Excel do Google Drive](/dal_excel_from_google_drive.sas)

Essa macro %dal_excel_from_google_drive faz com que a planilha no formato Excel (XLSX) disponibilizada na nuvem do Google Drive de modo público, seja baixada e atualizada no SAS. Excelente forma de atualizar informações complementares de dados, como fontes e dicionário de dados.