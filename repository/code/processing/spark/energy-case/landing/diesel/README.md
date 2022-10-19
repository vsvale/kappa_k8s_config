# Build spark image
- docker pull gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
- docker build ./repository/code/processing/spark/energy-case/landing/diesel/ -t diesel-to-landing:1.0.0
- docker tag diesel-to-landing:1.0.0 vsvale/diesel-to-landing:1.0.0
- docker login
- docker push vsvale/diesel-to-landing:1.0.0

# Put yaml in dag folder in airflow repository
