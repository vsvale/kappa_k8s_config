## What is

By using the Sealed Secrets controller, we can finally store all our secrets in Git (in an encrypted form) right along the application configuration.

The full process is the following:

1. You create a plain Kubernetes secret locally. You should never commit this anywhere.
2. You use kubeseal to encrypt the secret in a SealedSecret.
3. You delete the original secret from your workstation and apply the sealed secret to the cluster.
4. You can optionally commit the Sealed secret to Git.
5. You deploy your application that expects normal Kubernetes secrets to function. (The application needs no modifications of any kind.)
6. The controller decrypts the Sealed secrets and passes them to your application as plain secrets.
7. The application works as usual.

![sealedsecrets.png](imgs/sealedsecrets.png)

## Install
- `helm repo add sealed-secrets https://bitnami-labs.github.io/sealed-secrets`
- `kubectl apply -f https://raw.githubusercontent.com/vsvale/kappa_k8s_config/master/repository/app-manifests/security/sealedsecret.yaml`

## Install CLI dev

- `VERSION=$(curl --silent "https://api.github.com/repos/bitnami-labs/sealed-secrets/releases/latest" | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')`
- `curl -L --output - https://github.com/bitnami-labs/sealed-secrets/releases/download/v0.18.5/kubeseal-0.18.5-linux-amd64.tar.gz | tar zx`
- `sudo mv ./kubeseal /usr/local/bin/kubeseal`
- `sudo chmod +x /usr/local/bin/kubeseal`

## Encrypt

Encryption happens via the kubeseal executable. Decryption happens via the Sealed Secrets controller.

- `kubeseal --controller-name=sealed-secrets-controller --controller-namespace security < ./repository/yamls/security/smtp_insecure.yaml > ./repository/yamls/security/smtp_secure.yaml -o yaml`

db-creds.yml

```
apiVersion: v1
kind: Secret
type: Opaque
metadata:
  name: mysql-credentials
data:
  connection: bXktZGItY29ubmVjdGlvbi5leGFtcGxlLmNvbTozMzA2
  password: bXlmYW5jeXBhc3N3b3Jk
  username: bXlmYW5jeXVzZXI=
```

db-creds-encrypted.yaml

```
apiVersion: bitnami.com/v1alpha1
kind: SealedSecret
metadata:
  creationTimestamp: null
  name: mysql-credentials
  namespace: default
spec:
  encryptedData:
    connection: AgCZJ9TuDb2jRq9ZfpYSFWaBl/EAQwpNi6gm1QkBDhp21igs9JVACQ0nhZi1epZ7jt1hvl0gUHJ/jxUT9DzUCu7g/bXTc0V47p6EqCb4R7gvHTVUehN4FmJb3JwosSIpg0d1Ol2wNndnj2marOr1CilMnd+s86Kjdzr0HM4OV7jRbubIeZ10rPjRwEENGzJG3+lnVMd74kKL0JO9U8hHvaWxoXLMV5C0XQYrXOLGwmMgWy/k6/0o/4BVgLlIes2Mtk3iAXRAjWQTGUe0V0I5joAlII1qLG/nCw0CY6HA9cH9M03l3LgUd0DSxX7UJIUNqR5zuLqlW+jRx1BSXGvKHOhr7MRUBX0FogRDIx0MMB5f77BPCrNs7mT0YAgEIC6XukMyBwo5wbrsQD8rBs6eTYV7+RxUzsfwhqrZp65ntsg4qkZfcULWMgsxDJgUpf3rLPZrHwSbErG5rHwXNvSL16wDcjD9nhLcCuz+3okoM0ludv/+BdTPe+uHKwCJUhKj/b9o0bvMNmdD0O3Htan69aGsyvzh/Yn4u/6L5aj1baaSr/eILkY87/p+4WjtrjjX65JJa4+erJprHpdVmY3FSl1RD0vIvvdrKw6E/v2eX2c+tO61wkPyT1NJXardQ22cXEie8aLTEMa0erHCuk450S9P5Ng5gDmWkrIgmMtSzZJwR8FQHNMuhEiS2D0OVYMMHy4fUG3+0j8toZLH6ZKbyqa6pNdh0HfPhd6+RLEogGAOYUY=
    password: AgBCfsml+WPb+V+m9J4XjwuyJetpV8SiQRMtaK8j4QBlGhYMAsAHNA7pCSZMkw1MvxIPC41hbhvcUX3eAq/0It3p0a03aJ3d0UnhOKaBh9wPeLoc0J65ivB35v9VbOTkl+11qHME3uN3JpFUW057lJHLX/XSSMt+iG0pT4KoXYPUQlbRd57x4GT7XmUlNKAwKFe2REHE5cSASYDXEbXGionOoiyJK9wtbFMetuND0ott3pqYBYFVJ6xhSlM9V1y+0l9slVpuEsnEGIPL1lskktpzcq0ZZXatBGwWeh68w9Nj85V6ZWuCEXZeQgw9K0I6BNFuvKA4AsZiQmnKUMrPDQRFo0gFfXt6NcWyzkiaeFC9XD8TxugQgWXQrOhw5g8DsQK1KRFebGk/nT4kHbIuLh8MNdNEEpzEYJCecJ/NeRAFrUzxF881w5t5VyeiOTpRLnOFuwnr2NNODrzQzwaMYKGN4rVb6kkbGP76HfaabGM+1aArl7xsQOALqMhPzix0hgrH2LDQZKl9dmkpNMNjZFRLV1YFXBHjRcebwxVNFXi7EujwvrFySNB2Zs5y10trbQU+2tTIpuUsA9/d9KzbhGlgYBOm6Uc9hnFTbjUhZmzsVy6id7NcnRQkv08Z7XFUS2losc0YBtvF4Jf0yOFUUvCRhF6kJ+npjkzwOR8H4cEV/8xWH0J6h/c0sn6yN0WxdnvTrqjckt37ucJYc/ZXkYk=
    username: AgAn4vwF3/Txxp+DRN3TnOqaSFySF+j/ntUzQGMmlEi46B5/m3AwvhqeeJL9w8UKB+Tsgbpj88GNZJRlqhp91siuIA+J5akvaeKSlc1En9YY6TR5ChpZVZC8zTGjR1+6zrk6LL5ZSwjyd242rdr3p9gjtoGpYCmp5FUXljAcIeMPzvi16bfCKDuoMzAEWl1yr9eg7UeF14QKV+0nwOogurKMZoSJMvCC8HTUZ4njP2d6yWogCgjR47jTfrPJpICDl1c5l19uaIqrobCh4bFRI84Cv5KnugpWu/BdPusyaCAnQs2uDfGBXXrem9aF4TyOS6Aid3z3MXKoL6Nh1bTLGI9Y3mgZ8c5gdbX/NYwlAmFWfqiRC1VkGovUO0wcAI3gKlxmm8Yq/3mL/m+WYJRTSljSOxkGH0j7xmVqm1f11UhbkAJ4XXPzLgGfXtC9Wx6lHUVOLWexX6jSxjB3KqfjS3OvpW5Zr2KYSp4JKhJ/4r+o7fo9Mf7pMNBhwQFXetB8JiUcPtT+ERGCAHAgb32SgVvBdQBNmJ3TvxaSUOpsNKwGggJoJWbrfj3T216TO7oAAGZ48hnUtxbuIjs7LY5qMqqX1V0BEXsctYhdwgHvNFWucSSVSZEfuydH77ElxaggG1No6MOEeEd049LUxUXXMFuXCsLVcMxHRnhuEyxi1j6qT1DvUhHQ6w3P11TqtY4XCb5hQEeM1T19XQVBwg==
  template:
    data: null
    metadata:
      creationTimestamp: null
      name: mysql-credentials
      namespace: default
    type: Opaque
```

- Coloque o arquivo encriptado junto com os demais manifestos e apague o original descriptografado
