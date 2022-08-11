# Datalake
- Repositorio de dados brutos, assim como são na fonte origem
- Democratização dos dados: substituir várias conexões com diversos bancos para uma conexão para consulta de arquivos em batch
- Seviços de Object Storage: S3, HDFS, Blob Storage, Cloud Storage
- Ler o dado Raw e fazer o incremento é um desafio
- Data Swamp: dados desorganizados, sem metadado
- Parquet: formato ideal para data lakes, é compresso, colunar e otimizado para processsamento
- Datalake é suscetível a Small files problem

# [Delta Lake](https://delta.io/)
- Storage Layer with ACID Open Source acima do datalake para gerar dados limpos e sanitizados para permitir processamento spark eficiente
- Escrita de dados concorrentemente com integridade
- Delta: formato otimizado com ACID
- Time Travel: voltar o dado ou o esquema para um snapshot anterior
- Schema Enforciment e Schema Evolution: os tipos dos dados é forçado, mas a inclusão de novos campos não quebra o processo de ETL
- Transaction Log: guarda todas as informações para auditiorias
- Update, delete, merge (upsert) por key
- Compativel com LGPD






