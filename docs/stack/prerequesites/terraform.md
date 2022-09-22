# Terraform

## IaC

- Provisioning infrastructure through software to achieve consistent and predictable deployments
- Defined in code: json, yaml
- stored in source control: git
- Declarative
- Idempotent and consistent: if there is no change code and apply it again to the same enviroment, nothing will change
- push-type to the enviroment

### Benefits of IaC

- Automated deployment
- Repeatable process
- Consistent environments
- Reusable components
- Documented architecture

## Terraform

- Infrastructure automation tool
- Open-source and vendor agnostic
- Declarative syntax
- HashiCorp configuration Language or JSON
- push-type to the enviroment

### Components

- Executable
- Configuration files
- Provider plugins
- State data: current information in target enviroment

## Install

- `wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg`
- `echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list`
- `sudo apt update && sudo apt install terraform`
- `terraform version`

## Namespaces and Change default storage class

- `cd ./repository/code/cluster/minikube`
- `terraform init`
- `terraform plan`
- `terraform apply`
- `kubectl get ns`
- `kubectl get storageclass`
- `cd ../../../..`
