## Install App of Apps
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/processing.yaml`

OR Install Manual

## Install Spark
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/spark-operator.yaml`
- `watch kubectl get pods -n processing`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/processing/spark/crb_spark_operator.yaml`

### Create base image
- docker pull gcr.io/spark-operator/spark-py:v3.1.1-hadoop3
- docker build ./repository/code/processing/spark/base_image/ -t spark_base_image:3.1.1
- docker tag spark_base_image:3.1.1 vsvale/spark_base_image:3.1.1
- docker login
- docker push vsvale/spark_base_image:3.1.1

## Install ksqldb

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/ksqldb.yaml`
- `watch kubectl get pods -n processing`
- KSQLDB=nomedopod
- `kubectl exec $KSQLDB -n processing -ti -- bash ksql`


