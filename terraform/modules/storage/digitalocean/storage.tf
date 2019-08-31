variable "storage_acl" { default = "private" }
variable "storage_name" {}

variable "storage_region" { default = "sgp1" }


resource "digitalocean_spaces_bucket" "infrastructure-space" {
    name    =   "${var.storage_name}"
    acl     =   "${var.storage_acl}"
    region  =   "${var.storage_region}"
}
