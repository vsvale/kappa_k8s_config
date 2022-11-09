# Build spark image
- docker login
- docker build ./repository/code/processing/spark/example/bronze -t vsvale/example-bronze:1.0.0; docker push vsvale/example-bronze:1.0.0;
- Put yaml in dag folder in airflow repository
- trigger dag
- kubectl logs diesel-to-landing-driver -n processing