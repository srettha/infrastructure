resource "digitalocean_spaces_bucket" "storage" {
    name    =   "${var.storage_name}"
    acl     =   "${var.storage_acl}"
    region  =   "${var.storage_region}"
}
