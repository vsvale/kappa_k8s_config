# provider https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_cluster

data "digitalocean_kubernetes_versions" "cluster" {
  version_prefix = "1.24.4-do.0"
}

# name = name of the cluster
# region = region that is going to be deployed
# auto_upgrade = apply patches
# version = k8s version
resource "digitalocean_kubernetes_cluster" "k8s-vale" {
  name         = "k8s-vale"
  region       = "nyc1"
  auto_upgrade = true
  version      = data.digitalocean_kubernetes_versions.cluster.latest_version

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  node_pool {
    name       = "k8s-vale-worker-pool"
    size       = "s-4vcpu-8gb"
    node_count = 5
    tags       = ["dev"]
    auto_scale = true
    min_nodes  = 3
    max_nodes  = 5
  }
}
