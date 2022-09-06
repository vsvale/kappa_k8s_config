- Data serving
- OLAP System for real-time insights at scale
- Realtime Distributed OLAP DataStore, Designed for Ansering OLAP Queries with Low-Latency
- Colunar Oriented Storage
- Pluggable indexing Technologies
- Horizontal Scale & Fault-Tolerant
- Perform Anomaly Detection using ThirdEye
- Join using Presto e Trino

## Install

- `helm repo add pinot https://raw.githubusercontent.com/apache/pinot/master/kubernetes/helm`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/datastore/pinot.yaml`

# Commands

- `kubectl cp realtime_kafka_users_events.json datastore/pinot-controller-0:/opt/pinot`
- `kubectl cp sch_kafka_users_json.json datastore/pinot-controller-0:/opt/pinot`
- `kubectl exec pinot-controleer-0 -i -t -- bash`
- `JAVA_OPTS=""`
- `bin/pinot-admin.sh AddTable -schemaFile /opt/pinot/sch_kafka_users.json -tableConfigFile /opt/pinot/realtime_kafka_users_events.json -exec`
