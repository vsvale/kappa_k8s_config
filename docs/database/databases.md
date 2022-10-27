## Database App of Apps
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/database.yaml`

## Manual Instalation
## MSSQL

- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mssql.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_mssql.yaml -n database`
- optional: create OwsHQ database
- user: sa
- password: IlS27OpKxw9EYObU80dz

## MYSQL
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mysql.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_mysql.yaml -n database`
- database: owshq
- user: plumber
- Password:PlumberSDE

## POSTGRES
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/postgres.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_postgres.yaml -n database`
- database: owshq
- user: plumber
- Password:PlumberSDE

## MONGODB
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/mongodb.yaml`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/yamls/database/svc_lb_mongodb.yaml -n database`

## YUGABYTE
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/database/yugabytedb.yaml`
