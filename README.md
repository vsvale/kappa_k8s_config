## Prerequisites

Install [prerequisites](./docs/stack/prerequesites/README.md)

## CICD

[Argocd](./docs/stack/tools/cicd/argocd.md)

## Ingestion

[Strimzi](./docs/stack/tools/ingestion/strimzi.md)

##

[Spark](./processing/spark.md)

### Databases

[Mysql](./docs/stack/tools/database/databases.md)

### Resume

- `minikube -p minikube start --nodes 3  --cpus='4' --memory='16g' --disk-size=150g --container-runtime='docker' --driver='docker' --extra-config=kubelet.runtime-request-timeout=10m0s`
- `minikube kubectl -- get po -A`
- `cd kappa_k8s_config`
- `cd ./repository/code/cluster/minikube`
- `terraform init`
- `terraform plan`
- `terraform apply`
- `kubectl get ns`
- `kubectl get storageclass`
- `cd ../../..`
- `helm upgrade --install -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/helm-charts/cicd/argo-cd/values-deployment.yaml argocd argo/argo-cd --namespace cicd --debug --timeout 10m0s`
- `kubectl patch svc argocd-server -n cicd -p '{"spec": {"type": "LoadBalancer"}}'`
- `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`
- `kubectl create clusterrolebinding cluster-admin-binding --clusterrole=cluster-admin --user=system:serviceaccount:cicd:argocd-application-controller -n cicd`
- `kubens cicd && CLUSTER=$(kubectx) && argocd cluster add $CLUSTER --in-cluster --insecure`
- `argocd repo add https://github.com/vsvale/kappa_k8s_config.git --port-forward`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/strimzi.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/metrics.yaml`
- ephemeral: `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-broker-ephemeral.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connect.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/schema-registry.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/cruise-control.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/ingestion/kafka-connectors.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/spark-operator.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/yugabytedb.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/deepstorage/miniooperator.yaml`
- `kubectl get secret $(kubectl get serviceaccount console-sa --namespace deepstorage -o jsonpath="{.secrets[0].name}") --namespace deepstorage -o jsonpath="{.data.token}" | base64 --decode`
- `kubectl patch svc console -n deepstorage -p '{"spec": {"type": "LoadBalancer"}}'`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/datastore/pinot.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/ksqldb.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/processing/trino.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/orchestrator/airflow.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/dataops/lenses.yaml`
