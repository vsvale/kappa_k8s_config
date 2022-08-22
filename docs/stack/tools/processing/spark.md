k create namespace processing
helm repo add spark-operator <https://googlecloudplatform.github.io/spark-on-k8s-operator>
helm repo update
helm install spark spark-operator/spark-operator --namespace processing --set image.tag=v1beta2-1.3.0-3.1.1
