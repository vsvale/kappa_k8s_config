## MSSQL

- `helm repo add stable https://charts.helm.sh/stable`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mssql.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_mssql.yaml -n database`

## MYSQL

- `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mysql.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_mysql.yaml -n database`
- 

## POSTGRES

- `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/postgres.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_postgres.yaml -n database`


## MONGODB

- `helm repo add bitnami https://charts.bitnami.com/bitnami`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mongodb.yaml`

## YUGABYTE

- `helm repo add yugabytedb https://charts.yugabyte.com`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/yugabytedb.yaml`
