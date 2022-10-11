from pyspark.sql import SparkSession

spark = (
    SparkSession
    .builder
    .appname('diesel-to-landing')
    config("spark.hadoop.fs.s3a.endpoint", "https://172.18.0.2") 
)