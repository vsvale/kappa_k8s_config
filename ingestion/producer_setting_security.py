def producer_settingz_json_cram_sha_512(broker):
    json ={
        'client.id':kafka_client_id_json,
        'bootstrap.servers':broker,
        'security.protocol':'SASL_SSL',
        'sasl.mechanism':'SCRAM-SHA-512',
        'ssl.ca.location':kafka_ca_location,
        'sasl.username':kafka_sasl_username,
        'sasl.password':kafka_sasl_password,
        'log.connection.close':True
    }