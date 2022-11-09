# import libraries
from delta.tables import DeltaTable
from pyspark.sql import SparkSession
from pyspark import SparkConf
from pyspark.sql.functions import current_timestamp, current_date

# main spark program
# init application
if __name__ == '__main__':

    # init session
    # set configs
    spark = SparkSession \
        .builder \
        .appName("customer-bronze-py") \
        .config("spark.hadoop.fs.s3a.endpoint", "http://172.18.0.2:8686") \
        .config("spark.hadoop.fs.s3a.access.key", "4jVszc6Opmq7oaOu") \
        .config("spark.hadoop.fs.s3a.secret.key", "ebUjidNSHktNJOhaqeRseqmEr9IEBggD") \
        .config("spark.hadoop.fs.s3a.path.style.access", True) \
        .config("spark.hadoop.fs.s3a.fast.upload", True) \
        .config("spark.hadoop.fs.s3a.multipart.size", 104857600) \
        .config("fs.s3a.connection.maximum", 100) \
        .config("spark.hadoop.fs.s3a.impl", "org.apache.hadoop.fs.s3a.S3AFileSystem") \
        .config("spark.delta.logStore.class", "org.apache.spark.sql.delta.storage.S3SingleDriverLogStore") \
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension") \
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog") \
        .getOrCreate()

    # show configured parameters
    print(SparkConf().getAll())

    # set log level
    spark.sparkContext.setLogLevel("INFO")

    # variables
    topic = "src-example-customer"
    destination_folder = "/example/customer/"

    # [landing zone area]
    # device and subscription
    landing_path = "s3a://landing/example/"+topic+"/*/*/*/*/*.parquet"

    # read device data
    # json file from landing zone
    landing_table = spark.read.parquet(landing_path)

    # get number of partitions
    print(landing_table.rdd.getNumPartitions())

    # count amount of rows ingested from lake
    landing_table.count()

    landing_table.printSchema()

    landing_table.show()

    landing_table = landing_table.withColumn("b_create_at", current_timestamp())
    landing_table = landing_table.withColumn("b_load_date", current_date())


    # [write to lakehouse]
    # [bronze zone area]
    # data lakehouse paradigm
    # need to read the entire landing zone
    # usual scenario but not the best practice
    write_delta_mode = "overwrite"
    delta_bronze_zone = "s3a://lakehouse/bronze"
    bronze = delta_bronze_zone + destination_folder
    
    if DeltaTable.isDeltaTable(spark, bronze):
        dt_table = DeltaTable.forPath(spark, bronze)
        dt_table.alias("historical_data")\
            .merge(
                landing_table.alias("new_data"),
                '''
                historical_data.CustomerID = new_data.CustomerID 
                AND historical_data.created_at = new_data.created_at
                AND historical_data.Custom_TS = new_data.Custom_TS''')\
            .whenMatchedUpdateAll()\
            .whenNotMatchedInsertAll()
    else:
        landing_table.write.mode(write_delta_mode)\
            .format("delta")\
            .partitionBy("b_load_date")\
            .save(bronze)


    # stop session
    spark.stop()