# Build spark image

- docker build ./repository/code/processing/spark/example/bronze -t example-customer-bronze:1.0.0
- docker tag example-customer-bronze:1.0.0 vsvale/example-customer-bronze:1.0.0
- docker login
- docker push vsvale/example-customer-bronze:1.0.0
- Put yaml in dag folder in airflow repository
- trigger dag
- kubectl logs diesel-to-landing-driver -n processing