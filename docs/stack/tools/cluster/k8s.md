# K8s

![K8s.excalidraw.png](../../../imgs/K8s.excalidraw.png)
![pods.excalidraw.png](../../../imgs/pods.excalidraw.png)

- [Cheat sheet](https://kubernetes.io/pt-br/docs/reference/kubectl/cheatsheet/)
- [Basics](https://kubernetes.io/pt-br/docs/tutorials/kubernetes-basics/)

## Comands

- `kubectl version`

### Nodes

- `kubectl get nodes`

### Pods

- `kubectl apply -f ./repository/yamls/templates/pod.yaml`
- `kubectl get pods`
- `kubectl describe pod podname`
- `kubectl exec podname -it -- /bin/sh`
- `kubectl logs podname`
- `kubectl delete pod podname`

### Daemonset

- `kubectl apply -f ./repository/yamls/templates/daemonset.yaml`
- `kubectl get daemonset`

### Replicaset

- `kubectl apply -f ./repository/yamls/templates/deployment.yaml`
- `kubectl get replicaset`

### Statefulset

- `kubectl apply -f ./repository/yamls/templates/statefulset.yaml`
- `kubectl get replicaset`
- `kubectl get pvc`
- `kubectl get pv`

### service

- `kubectl apply -f kappa_k8s_config/repository/yamls/templates/service.yaml`
- `kubectl get svc`

### storageclass

- `kubectl get storageclass`
- `kubectl describe sc standard`

# Tips

`imagePullPolicy: Always` toda vez que dar o apply vai pegar a versão mais recente da imagem
