
## Download the Configuration File from the DigitalOcean Control Panel

- First, log in to the DigitalOcean control panel and click the name of the cluster to go to its Overview tab.
- In the Access Cluster Config File section, click Download Config File to download the kubeconfig file. The file format will be <cluster_name>-kubeconfig.yaml.
- Move the <cluster_name>-kubeconfig.yaml file into the ~/.kube directory and pass it to kubectl with the –kubeconfig flag. For example:
- `kubectl --kubeconfig=~/.kube/<cluster_name>-kubeconfig.yaml get nodes`
- `export KUBECONFIG=$KUBECONFIG:$HOME/.kube/valek8s-kubeconfig.yaml`
