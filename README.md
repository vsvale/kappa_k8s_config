1. Install [WSL](./docs/wsl.md)
2. Install [minikube](./docs/minikube.md)
3. minikube start && minikube tunnel
4. Install [argocd](./docs/argocd.md)
5. Login Argo
 `ARGOCD_EXTRIP=$(kubectl -n cicd get services -l app.kubernetes.io/name=argocd-server,app.kubernetes.io/instance=argocd -o jsonpath="{.items[0].status.loadBalancer.ingress[0].ip}") && kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d | xargs -t -I {} argocd login $ARGOCD_EXTRIP --username admin --password {} --insecure`
5. Install [operators](./docs/operators/README.md)
