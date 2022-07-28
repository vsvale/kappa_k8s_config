[Airflow pattern](https://www.youtube.com/watch?v=sQzp9HD8Yto&list=PLOHm04l2nJtK6Gw-3WLfeN0FVydWyzDv8&index=2&t=2412s) &
[MiniO pattern](https://www.youtube.com/watch?v=sQzp9HD8Yto&list=PLOHm04l2nJtK6Gw-3WLfeN0FVydWyzDv8&index=2&t=2412s)

#### Airflow Flow
verify_file_existence_landing >> list_file_s3 >> copy_s3_file_processed_zone >> delete_s3_file_landing_zone >> process_business_data >> delete_s3_file_processed_zone >> drop_postgres_tb >> create_postgres_tb >> write_business_dt_yugabytedb >> count_yuga_vs_process_zone

### Kappa Flow
Origen > kafka COnector > Kafka > MiniO [Landing] > Airflow Sensor > MiniO [processing] > Deltalake[partition=128Mb] > Spark [transform] > Yogabite