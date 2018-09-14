resource "digitalocean_floating_ip" "droplet" {
  count             = "${var.count}"
  droplet_id        = "${element(digitalocean_droplet.droplet.*.id, count.index)}"
  region            = "${element(digitalocean_droplet.droplet.*.region, count.index)}"
}

resource "digitalocean_ssh_key" "droplet" {
  name          = "droplet default-${var.name} ssh_key"
  public_key    = "${var.pub_key}"
}

resource "digitalocean_tag" "droplet" {
  name = "${var.tag}"
}

resource "digitalocean_droplet" "droplet" {
  count              = "${var.count}"
  image              = "${var.image}"
  monitoring         = "${var.monitoring}"
  name               = "${var.name}-${count.index+1}" # "droplet-1"
  private_networking = "${var.private_networking}"
  region             = "${var.region}"
  size               = "${var.size}"
  ssh_keys           = [
    "${digitalocean_ssh_key.droplet.fingerprint}"
  ]
  tags               = [
    "${digitalocean_tag.droplet.id}"
  ]
}

resource "digitalocean_firewall" "droplet-firewall" {
  name        = "${var.name}-only-22-80-and-443"
  droplet_ids = [
    "${digitalocean_droplet.droplet.*.id}"
  ]

  inbound_rule = [
    {
      protocol         = "tcp"
      port_range       = "22"
      source_addresses = ["0.0.0.0/0", "::/0"] # This should be limited to certain ip-address
    },
    {
      protocol         = "tcp"
      port_range       = "80"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
    {
      protocol         = "tcp"
      port_range       = "443"
      source_addresses = ["0.0.0.0/0", "::/0"]
    },
  ]

  outbound_rule = [
    {
      protocol              = "tcp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },
    {
      protocol              = "udp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },
    {
      protocol              = "icmp"
      port_range            = "1-65535"
      destination_addresses = ["0.0.0.0/0"]
    },
  ]
}
