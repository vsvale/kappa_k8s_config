### Starboard

- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/starboard/argo-helm-starboard.yaml`
- `argocd app sync starboard`

### Prometheus

- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/prometheus/argo-helm-prom-crds.yaml`
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/prometheus/argo-helm-prometheus.yaml`
- `kubectl port-forward service/prometheus-kube-prometheus-prometheus -n monitoring 9090:9090`
- `kubectl port-forward service/prometheus-grafana -n monitoring 5000:80`
- admin prom-operator
- `kubectl apply -n argocd -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/operators/starboard/argo-helm-starexporter.yaml`
