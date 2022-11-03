## Kong Secrets
- kubectl create secret generic kong-config-secret -n gateway \
    --from-literal=portal_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"portal_session","cookie_samesite":"off","cookie_secure":false}' \
    --from-literal=admin_gui_session_conf='{"storage":"kong","secret":"super_secret_salt_string","cookie_name":"admin_session","cookie_samesite":"off","cookie_secure":false}' \
    --from-literal=pg_host="enterprise-postgresql.kong.svc.cluster.local" \
    --from-literal=kong_admin_password=kong \
    --from-literal=password=kong
- kubectl create secret generic kong-enterprise-license --from-literal=license="'{}'" -n gateway --dry-run=client -o yaml | kubectl apply -f -

## jetstack
- kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/cluster-manifests/cluster/gateway.yaml
- helm repo add kong https://charts.konghq.com

## Konga

## Istio