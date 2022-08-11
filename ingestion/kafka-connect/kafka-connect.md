### To do
- Caso a origem seja uma API rest será necessário utilizar Skin (app producer + uma api gateway (kong))
- Identificar os conectores necessarios
    - [JDBC](https://www.confluent.io/hub/confluentinc/kafka-connect-jdbc)
    - [Debezium SQL Server](https://www.confluent.io/hub/debezium/debezium-connector-sqlserver)
    - [Debezium Mysql](https://www.confluent.io/hub/debezium/debezium-connector-mysql)
    - [Debezium PostgreSQL](https://www.confluent.io/hub/debezium/debezium-connector-postgresql)
    - [MongoDB](https://www.confluent.io/hub/mongodb/kafka-connect-mongodb)
    - [Debezium MongoDB](https://www.confluent.io/hub/debezium/debezium-connector-mongodb)
    - [Oracle CDC](https://www.confluent.io/hub/a2solutions/oracdc-kafka)
- Baixar Jars
    - [PostgreSQL](https://jdbc.postgresql.org/download.html)
        - `curl -Lo postgresql.jar https://jdbc.postgresql.org/download/postgresql-42.4.1.jar`
        - `sudo mv ./postgresql.jar ./ingestion/jars/kafka-connect-jdbc/postgresql.jar`
    - [SQLServer](https://docs.microsoft.com/pt-br/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server?view=sql-server-ver16)
        - `curl -Lo sqlserver.jar https://go.microsoft.com/fwlink/?linkid=2195718`
        - `sudo mv ./sqlserver.jar ./ingestion/jars/kafka-connect-jdbc/sqlserver.jar`
    - [Mysql](https://dev.mysql.com/downloads/file/?id=513221)
        - `curl -Lo mysql.jar https://dev.mysql.com/downloads/file/?id=513221`
        - `sudo mv ./mysql.jar ./ingestion/jars/kafka-connect-jdbc/mysql.jar`
    - [Oracle](https://www.oracle.com/br/database/technologies/appdev/jdbc-downloads.html)
    - [MongoDB](https://search.maven.org/artifact/org.mongodb/mongodb-jdbc)


### Login docker Hub
docker login

### pull latest image version
docker pull quay.io/strimzi/kafka:latest-kafka-3.2.1

### verify local images
docker images

### build latest image
cd kappa_k8s_config/ingestion/kafka-connect/
docker build -f Dockerfile.latest --tag our-image-kafka-connect-strimzi:3.2.1 .

### https://hub.docker.com/repositories

# tag image
docker tag kappa-kafka-connect-strimzi:3.2.1 vsvale/kappa-kafka-connect-strimzi:3.2.1

# push image to registry
docker push vsvale/kappa-kafka-connect-strimzi:3.2.1