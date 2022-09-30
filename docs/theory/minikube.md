### [LoadBalancer](https://minikube.sigs.k8s.io/docs/handbook/accessing/)

- `minikube tunnel`

### Acessar node

- `minikube ssh -n minikube`
- `minikube ssh -n minikube-m02`

### Pull manually images
- `minikube ssh docker pull "quay.io/cilium/cilium:v1.12.1@sha256:ea2db1ee21b88127b5c18a96ad155c25485d0815a667ef77c2b7c7f31cab601b" -p minikube`

### Delete cluster

- `minikube delete --all --purge`
