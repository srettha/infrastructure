resource "digitalocean_tag" "kubernetes_master" {
    name    =   "${var.kubernetes_master_name}"
}

resource "digitalocean_tag" "kubernetes_nodes" {
    count   =   "${var.kubernetes_nodes_count}"
    name    =   "${var.kubernetes_nodes_name}-${count.index+1}"
}

resource "digitalocean_tag" "kubernetes_region" {
    name    =   "${var.kubernetes_region}"
}


resource "digitalocean_tag" "kubernetes_environment" {
    name    =   "${var.environment}"
}

resource "digitalocean_kubernetes_cluster" "kubernetes" {
    name        =   "${var.kubernetes_master_name}"
    region      =   "${var.kubernetes_region}"
    version     =   "${var.kubernetes_version}"

    node_pool {
        count       =   "${var.kubernetes_nodes_count}"
        name        =   "${var.kubernetes_nodes_name}-${count.index+1}"
        size        =   "${var.kubernetes_nodes_size}"
        node_count  =   "${var.kubernetes_nodes_count}"
        tags        =   [
            "${digitalocean_tag.kubernetes_nodes.*.id}",
            "${digitalocean_tag.kubernetes_region.id}",
            "${digitalocean_tag.kubernetes_environment.id}"
        ]
    }

    tags        =   [
        "${digitalocean_tag.kubernetes_master.id}",
        "${digitalocean_tag.kubernetes_region.id}",
        "${digitalocean_tag.kubernetes_environment.id}"
    ]
}
