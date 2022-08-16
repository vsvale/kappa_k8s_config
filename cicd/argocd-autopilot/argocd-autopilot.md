# Argocd-autopilot

- `https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token`
- `export GIT_TOKEN=<Acesstokengerado>`
- `export GIT_REPO=https://github.com/vsvale/kappa_k8s_config/tree/master/cicd/argocd-autopilot`
- `argocd-autopilot repo bootstrap --namespace cicd`
- `kubectl port-forward -n cicd svc/argocd-server 8080:80`
- `kubectl -n cicd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d`
- `argocd-autopilot project create kappa`
-
- `argocd-autopilot app create hello-world --app github.com/argoproj-labs/argocd-autopilot/examples/demo-app/ -p testing --wait-timeout 2m`

### Next steps

- Decide how to expose Argo CD API/UI to your users (Ingress)
- Decide how users are going to authenticate to Argo CD (SSO)

### Reference

- [Argocd-autopilot-git](https://github.com/argoproj-labs/argocd-autopilot)
- [Getting-Started](https://github.com/argoproj-labs/argocd-autopilot/blob/main/docs/Getting-Started.md)
