# K8s

![K8s.excalidraw.png](../../../imgs/K8s.excalidraw.png)
![pods.excalidraw.png](../../../imgs/pods.excalidraw.png)

- [Cheat sheet](https://kubernetes.io/pt-br/docs/reference/kubectl/cheatsheet/)
- [Basics](https://kubernetes.io/pt-br/docs/tutorials/kubernetes-basics/)

## Comands

- `kubectl version`

#### Listing and inspecting your cluster...helpful for knowing which cluster is your current context

- `kubectl cluster-info`

### Nodes

- `kubectl get nodes`
- `kubectl top nodes`

#### Additional information about each node in the cluster

- `kubectl get nodes -o wide`

### Pods

- wrapper around container based application
- can have one or mode containers
- unit of scheduling
- a process that's running and cosuming resources in our cluster
- unit of deployment: application configuration + resource (networkin and storage)
- provide higher level abstration over a container for manageability
- Pod Lifecycle (no pod is redeployed):
  - creation: administratively e controller
  - running: scheduled to a node
  - termination: process is terminated/crashed, pod is deleted, evicted due to lack of resources, node failure or maintenance
- create a pod declaratively: `kubectl apply -f ./repository/yamls/templates/pod.yaml`
- list of pods: `kubectl get pods`
- list of pods in a namespace: `kubectl get pods --namespace kube-system`
- additional info: `kubectl get pods --namespace kube-system -o wide`
- `kubectl describe pod podname`
- Launch a shell into the container: `kubectl exec podname -it -- /bin/sh`
- `kubectl logs podname`
- `kubectl delete pod podname`
- Pod with container restart policy: container in a pod can restart independent of the Pod, it's restarted by the kubelet on the same node. It restarts with an exponential backoff capped at 5m
  - spec.restarPolicy: [Always(default)/OnFailure/Never]
- Pod Health:
  - livenessProbes: runs a diagnostic check on a container. Per container setting. On failure, the kubelet restarts the container according to container restart Policy.
  - readinessProbes: runs a diagnostic check on the container to determine if they are ready to receive traffic from k8s service. Per container setting. On failue, remove Pod from load balancing. Prevents users from seeing application errors.
  - startupProbes: ensure all container in a pod are "Ready". Per container setting. On startup all other probes are disable until the startupProbe succeeds. On failure, the kubelet restarts the container according to the container restat policy. Good for apps with long startup times
  - inititalDelaySeconds: number of seconds after the container has started before running container probes, default 0
  - perriodSeconds: probe internal, default 10 seconds
  - timeoutSeconds: Probe timeout 1 seconds
  - failureThreshold: number of missed checks before reporting failure, default 3
  - successThreshold: number of probes to be considered successful and live, default 1

### Controllers

- keep your pods in the desired state, starting and stopping pods based in the configuration asserted in to the cluster
- Application scaling and recovery

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

#### dry run to create yaml declarative

kubectl command --dry-run=client -o yaml > file.yaml (valid syntax)
kubectl command --dry-run=server -o yaml > file.yaml (validate if we can create or modify the resources in this manifest)

#### Let's write this deployment yaml out to file

kubectl create deployment hello-world \
     --image=gcr.io/google-samples/hello-app:1.0 \
     --dry-run=client -o yaml > deployment.yaml

#### troubleshooting

kubectl logs pod-name

#### diff between what is in the cluester and newdeployment

kubectl diff -f newdeployment.yaml

#### Change our context if needed by specifying the Name

kubectl config use-context minikube

#### namespaces

- when you want to put a boundary around a resource or an object in terms of security, naming or resource allocation.
- Ability to subdivide a cluster and its resources. Give resource isolation or organizational boundaries in side the cluster.
- Assert some resources control upon namespaces, limiting CPU, disk, RAM, number of Pods
- Security boundary for Role-based Access Controls
- PersistentVolumes and Nodes aren't namespaced
- default namespace exists for whn you deploy resources and don't specify namespace
- kube-public readable by all users in the cluster, commonly used to store shared objects between namespaces fo access across the whole cluster like configmaps
- kube-system system pods, api server, etcd, controller manager
- Get a list of all the namespaces in our cluster: `kubectl get namespaces`
- get a list of all the API resources that can be in a namespace: `kubectl api-resources --namespaced=true | head`
- get a list of all the API resources that can be in a namespace: `kubectl api-resources --namespaced=false | head`
- get a list of every deployment in all namespaces: `kubectl get all --all-namespaces | more`
- describe namespace: `kubectl describe namespaces kube-system`
- Get a list of the pods in the kube-system namespace: `kubectl get pods --namespace kube-system`
- Imperatively create a namespace: `kubectl create namespace playground1`
- create yaml for namespace: `kubectl create namespace playground2 --dry-run=client -o yaml > plaugroundns2.yaml`
- declaratively create a namespace: `kubectl apply -f plaugroundns2.yaml`
- delete namespaces: `kubectl delete namespaces playground1`

#### labels

- when you want to act on an object or groups of objects or influence internal kubernetes operations
- used to organize resources like pods and nodes
- label selectors are used to query objects to enable perform operation on a collection of resources
- key/value pair
- can have more than one label per resource
- Look at all the Pod labels in our cluster: `kubectl get pods --show-labels`
- Query labels and selectors: `kubectl get pods -l tier=prod`
- Selector for multiple labels: `kubectl get pods -l 'tier in (prod,qa),app!=MyWebApp'`
- Output a particluar label in column format: `kubectl get pods -L tier,app`
- Edit an existing label: `kubectl label pod nginx-pod-1 tier=non-prod --overwrite`
- Adding a new label: `kubectl label pod nginx-pod-1 another=Label`
- Removing an existing label: `kubectl label pod nginx-pod-1 another-`
- Delete all pods matching our non-prod label: `kubectl delete pod -l tier=non-prod`

#### annotations

- when you want to add just additional information or metadata about a particular object or resource
- can't be used to query resources
- medatada.anotation: key:value
- `kubectl annotate pod nginx-pod owner=Anthony --overwrite`


### Node Pools
- utilizar D-series , M-series(memory), Ls-series(storage) e F-series(cpu) para poder escalar as maquinas

### Node Affinity, taint and toleration
- Node affinity put pods together


