output "digitalocean-kubernetes-config" {
  value = "${file("~/.kube/config")}"
}

output "digitalocean-kubernetes-id" {
    value = "${digitalocean_kubernetes_cluster.kubernetes.id}"
}

output "digitalocean-kubernetes-host" {
    value = "${digitalocean_kubernetes_cluster.kubernetes.endpoint}"
}

output "digitalocean-kubernetes-master-status" {
    value = "${digitalocean_kubernetes_cluster.kubernetes.status}"
}

output "digitalocean-kubernetes-nodes-id" {
  value = "${digitalocean_kubernetes_cluster.kubernetes.nodes_pool.id}"
}

output "digitalocean-kubernetes-nodes-status" {
    value = "${digitalocean_kubernetes_cluster.kubernetes.nodes_pool.nodes.status}"
}
