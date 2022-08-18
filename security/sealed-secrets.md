# Install

- `helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets`
- `helm repo update`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/security/yamls/sealed-secrets.yaml`
- `helm upgrade --install  sealed-secrets --namespace security --debug --timeout 10m0s --create-namespace --set-string fullnameOverride=sealed-secrets-controller sealed-secrets/sealed-secrets`

# Secret Flow

- You create a plain Kubernetes secret locally. You should never commit this anywhere.
- You use kubeseal to encrypt the secret in a SealedSecret.
- You delete the original secret from your workstation and apply the sealed secret to the cluster.
- You can optionally commit the Sealed secret to Git.
- You deploy your application that expects normal Kubernetes secrets to function. (The application needs no modifications of any kind.)
- The controller decrypts the Sealed secrets and passes them to your application as plain secrets.
- The application works as usual.
