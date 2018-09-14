output "digitalocean-name" {
  value = "${var.name}"
}

output "ip_v4_address_public" {
  value = "${digitalocean_droplet.droplet.*.ipv4_address}"
}
