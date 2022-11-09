# import libraries
from delta.tables import DeltaTable
from pyspark.sql import SparkSession
from pyspark import SparkConf
from pyspark.sql.types import DateType, StringType, TimestampType, DecimalType
from pyspark.sql.functions import current_timestamp, col, current_date

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

    # set location of files
    # minio data lake engine

    # [landing zone area]
    # device and subscription
    landing_customer = "s3a://landing/example/src-example-customer/*/*/*/*/*.parquet"

    # read device data
    # json file from landing zone
    customer = spark.read.parquet(landing_customer)

    # count amount of rows ingested from lake
    origin_count = customer.count()

    delta_bronze_zone = "s3a://lakehouse/bronze"
    destination_folder = "/example/customer/"

    b_customer = spark.read \
        .format("delta") \
        .load(delta_bronze_zone + destination_folder)
    
    destiny_count = b_customer.count()

    if origin_count != destiny_count:
        raise AssertionError("Counts of origin and destiny are not equal")

    # stop session
    spark.stop()