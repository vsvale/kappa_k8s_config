-- kubectl get pods -n processing
-- KSQLDB=nomedopod
-- kubectl exec $KSQLDB -n processing -ti -- bash ksql
SET 'auto.offset.reset' = 'earliest';
SHOW TOPICS;
CREATE OR REPLACE STREAM ksql_stream_sampledb_customer_avro WITH (KAFKA_TOPIC='src-sqlserver-jdbc-sampledb-custumer-avro', VALUE_FORMAT='AVRO', KEY_FORMAT='AVRO');
CREATE OR REPLACE STREAM ksql_stream_sampledb_salesorderheader_avro WITH (KAFKA_TOPIC='src-sqlserver-jdbc-sampledb-salesorderheader-avro', VALUE_FORMAT='AVRO', KEY_FORMAT='AVRO');
select * from ksql_stream_sampledb_customer_avro emit changes limit 100;
select * from ksql_stream_sampledb_salesorderheader_avro emit changes limit 10;
SELECT SalesPerson, count(SalesPerson) as "number_clients" from ksql_stream_sampledb_customer_avro WINDOW SESSION (5 SECONDS) group by SalesPerson EMIT CHANGES;







