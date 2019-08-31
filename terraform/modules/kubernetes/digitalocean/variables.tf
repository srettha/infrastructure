variable "environment" { }


variable "kubernetes_master_name" { }

variable "kubernetes_nodes_name" { }

variable "kubernetes_nodes_count" { default = "3" }

variable "kubernetes_nodes_size" { default = "s-1vcpu-2gb" }


variable "kubernetes_region" { default = "sgp1" }

variable "kubernetes_version" { default = "1.15.3-do.1" }

