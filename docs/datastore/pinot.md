##
- Update s3 credential in values

## Install
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/datastore.yaml`
OR Install Manual
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/datastore/pinot.yaml`

# Commands

- `kubectl cp realtime_kafka_users_events.json datastore/pinot-controller-0:/opt/pinot`
- `kubectl cp sch_kafka_users_json.json datastore/pinot-controller-0:/opt/pinot`
- `kubectl exec pinot-controleer-0 -i -t -- bash`
- `JAVA_OPTS=""`
- `bin/pinot-admin.sh AddTable -schemaFile /opt/pinot/sch_kafka_users.json -tableConfigFile /opt/pinot/realtime_kafka_users_events.json -exec`
