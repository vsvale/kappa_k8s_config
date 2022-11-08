# import libraries
from delta.tables import *
from pyspark.sql import SparkSession
from pyspark import SparkConf
from pyspark.sql.types import DateType, StringType, TimestampType, DecimalType
from pyspark.sql.functions import current_timestamp, col

# main spark program
# init application
if __name__ == '__main__':

    # init session
    # set configs
    spark = SparkSession \
        .builder \
        .appName("customer-bronze-py") \
        .config("spark.hadoop.fs.s3a.endpoint", "http://20.62.75.137") \
        .config("spark.hadoop.fs.s3a.access.key", "fikkgwHUG0LQjiCv") \
        .config("spark.hadoop.fs.s3a.secret.key", "6I1bwdteAZX4WXHmGWTDditWwAJvO1v9") \
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
    get_customer = "s3a://landing/example/*/*/*/*.parquet"
    get_subscription_file = "s3a://landing/subscription/*.json"

    # read device data
    # json file from landing zone
    df_device = spark.read \
        .format("parquet") \
        .option("inferSchema", "true") \
        .option("header", "true") \
        .json(get_customer)

    # get number of partitions
    print(df_device.rdd.getNumPartitions())

    # count amount of rows ingested from lake
    df_device.count()

    # stop session
    spark.stop()