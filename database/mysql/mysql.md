`kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/database/mysql/yamls/mysql.yaml`
kubectl get all
kubectl exec -it pod/mysql-0 -n database -- /bin/bash
