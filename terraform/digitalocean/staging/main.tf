terraform {
  backend "s3" {
    bucket                      = "terraform-state-bucket"
    endpoint                    = "sgp1.digitaloceanspaces.com"
    key                         = "staging/terraform.tfstate"
    region                      = "ap-southeast-1"
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

module "default-droplet-staging" {
  source                = "../modules/default-app"

  count                 = 1
  name                  = "default-app-sgp1-staging"
  pub_key               = "${file("./files/digitalocean-staging.pub")}"
  region                = "sgp1"
}
