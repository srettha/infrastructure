output "digitalocean-storage-name" {
  value = "${digitalocean_spaces_bucket.storage.name}"
}

output "digitalocean-storage-urn" {
  value = "${digitalocean_spaces_bucket.storage.urn}"
}

output "digitalocean-storage-region" {
  value = "${digitalocean_spaces_bucket.storage.region}"
}
