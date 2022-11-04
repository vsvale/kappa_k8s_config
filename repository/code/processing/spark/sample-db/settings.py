# get [env] information
BOOTSTRAP_SERVERS = 'edh-kafka-bootstrap.ingestion.svc.cluster.local:9092'
#BOOTSTRAP_SERVERS = '127.0.01:9092'
INPUT_CUSTOMER_TOPIC = 'src-sqlserver-jdbc-sampledb-custumer-avro'
INPUT_ORDERS_TOPIC = 'src-sqlserver-jdbc-sampledb-salesorderheader-avro'
OUTPUT_TOPIC = 'output-pyspark-sampledb-customer-orders-stream-avro'
STARTING_OFFSETS='earliest'
CHECKPOINT='checkpoint'