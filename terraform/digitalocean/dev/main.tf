provider "digitalocean" {
  token = "DIGITALOCEAN_TOKEN"
}


terraform {
  backend "s3" {
    bucket                      = "win-terraform-state"
    endpoint                    = "sgp1.digitaloceanspaces.com"
    key                         = "dev/terraform.tfstate"
    region                      = "ap-southeast-1"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
  }
}
