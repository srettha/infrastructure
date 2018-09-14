variable "count" { }

variable "image" {
  default = "ubuntu-16-04-x64"
  description = "See https://developers.digitalocean.com/documentation/v2/#list-all-images for a list of possible values"
}

variable "monitoring" {
  default = true
  description = "See https://www.digitalocean.com/docs/monitoring/ for explaination"
}

variable "name" {
  default = "default-app"
}

variable "private_networking" {
  default = false
  description = "See https://www.digitalocean.com/docs/networking/private-networking/ for explaination"
}

variable "pub_key" { }

variable "region" {
  default = "sgp1" # signapore region
  description = "See https://developers.digitalocean.com/documentation/v2/#regions for a list of possible values"
}

variable "resize_disk" {
  default = true
  description = "See https://www.digitalocean.com/docs/droplets/how-to/resize/#choosing-a-resize-type-disk-or-no-disk for explaination"
}


variable "size" {
  default = "s-1vcpu-1gb" # smallest droplet size
  description = "See https://developers.digitalocean.com/documentation/v2/#sizes for a list of possible values"
}

variable "tag" {
  default = "default-app"
}
