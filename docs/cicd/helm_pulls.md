### Update helms
- helm pull argo/argo-cd --untar -d ./repository/helm-charts/cicd
- helm pull strimzi/strimzi-kafka-operator --untar -d ./repository/helm-charts/ingestion
- helm pull valeriano-manassero/trino --untar -d ./repository/helm-charts/processing
- helm pull bitnami/mongodb-sharded  --untar -d ./repository/helm-charts/database
- helm pull bitnami/mysql  --untar -d ./repository/helm-charts/database
- helm pull bitnami/sealed-secrets --untar -d ./repository/helm-charts/security