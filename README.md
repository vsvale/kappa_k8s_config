# Kappa

## Prerequesites

[Prerequesites](https://github.com/vsvale/kappa_k8s_config/blob/master/cluster/prerequisites.md)

## Create cluster

[minikube](https://github.com/vsvale/kappa_k8s_config/blob/master/cluster/minikube.md)

## Deploy ArgoCD

[ArgoCD](https://github.com/vsvale/kappa_k8s_config/blob/master/cicd/argocd.md)

## Deploy Prometheus
[Prometheus](https://github.com/vsvale/kappa_k8s_config/blob/master/monitoring/prometheus.md)

## Deploy Strimzi
[Strimzi](https://github.com/vsvale/kappa_k8s_config/blob/master/ingestion/kafka/strimzi.md)

Problems? Problems? `kubectl -n <namespace> get events --sort-by='{.lastTimestamp}'`