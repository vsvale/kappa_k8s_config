-- kubectl get pods -n processing
-- KSQLDB=nomedopod
-- kubectl exec $KSQLDB -n processing -ti -- bash ksql
SET 'auto.offset.reset' = 'earliest';
SHOW TOPICS;
CREATE OR REPLACE STREAM ksql_stream_sampledb_customer_avro WITH (KAFKA_TOPIC='src-sqlserver-jdbc-sampledb-custumer-avro', VALUE_FORMAT='AVRO', KEY_FORMAT='AVRO');