## Install Helm

- `curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null`
- `sudo apt-get install apt-transport-https --yes`
- `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list`
- `sudo apt-get update`
- `sudo apt-get install helm`

## Commands

- Install chart: `helm install release_name and name_of_chart_you_want_to_install`
- List deploys: `helm list`
- Revision number: `helm history release_name`
- Rollback: `helm rollback release_name revision_id`
- Upgrade a release: `helm upgrade release_name chart_name`
