![Banner](/images/banner.png)

## 👨‍💻 Uso no SAS Visual Analytics (VA)

Esses repositório tem como função ajudar os programadores e analistas SAS a execução do Mapa Coroplético de um maneira simples e rápida, que possa ser replicada em vários projetos.

> [!CAUTION]
> Não me responsabilizo pelo uso indevido do código.

## 📖 Catálogo de Macros

1. [Carregar tabela da work e promover no CAS](/macros/sas_load_data_cas.sas)

A macro %sas_load_data_cas é uma ferramenta útil para automatizar o processo de deletar uma tabela existente da memória CAS, carregar uma nova tabela do SAS para o CAS e promover essa tabela para que fique disponível a todos os usuários do servidor.

2. [Atualizar tabela do CAS](/macros/sas_load_promote_cas.sas)

A macro %sas_load_promote_cas faz com que a tabela do CAS seja atualizada com novas informações. É uma macro excelente para caso você precise atualizar as tabelas diariamente de um DataLake, por exemplo.

3. [Baixar e carregar planilha Excel do Google Drive](/macros/dal_excel_from_google_drive.sas)

A macro %dal_excel_from_google_drive faz com que a planilha no formato Excel (XLSX) disponibilizada na nuvem do Google Drive de modo público, seja baixada e atualizada no SAS. Excelente forma de atualizar informações complementares de dados, como fontes e dicionário de dados.

4. [Criar Tabela Calendário no SAS](/macros/calendar_table.sas)

A macro %calendar_table cria uma tabela calendário na WORK. Depois você pode promovê-la e fazer com que seja carregado todos os dias, através de Fluxos de trabalhos.

5. [Mudar o nome da tabela em memória](/macros/sas_change_table_name.sas)

A macro %sas_change_table_name_cas muda o nome da tabela do CAS para minimizar erros de 32 caractéres.

## 📖 Catálogo de Códigos

1. [Colocar um HTML dentro do SAS VA](/sas-codes/html-on-SAS-VA/)

Esse código lhe dará uma base de como construir um HTML dentro do SAS VA de modo funcional, com botões de busca e exibindo imagens através do valor colocado no campo de pesquisa.

Para esse código funcionar, será necessário que você tenha conhecimento no SAS Job Execution.