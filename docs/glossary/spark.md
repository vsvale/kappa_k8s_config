Spark Stream
Ler e gravarno kfka
[video](https://www.youtube.com/watch?v=6Wbj9uJfvJA&t=3096s)
read.format('kafka') lê o topico inteiro
readstream.format('kafka') lê a partir do offset

df = (spark
        .readStream
        .format('kafka')
        .option('kafka.bootstrap.servers',BOOTSTRAP_SERVERS)
        .option('subscribe',INPUT_USERS_TOPIC)
        .option('startingOffsets',STARTING_OFFSETS)
        .option('checkpoint',CHECKPOINT)
        .load()
        .select(
            from_json(
                col('coluna').cast('string'),
                sch_users,
                jsonOptions).alias('ncoluna')
                )
)

## Gravar no YugabiteDB em batch

(df.write
    .format('jdbc')
    .mode('overwrite')
    .option('url','jdbc:postgresql://localhost')
    .option('dbtable','public.views_per_country_batch')
    .option('user','yugabite')
    .option('password','yugabite')
    .save()
)

##
