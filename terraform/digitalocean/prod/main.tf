terraform {
  backend "s3" {
    access_key                  = "___CHANGE_ME___"
    bucket                      = "terraform-state-bucket"
    endpoint                    = "https://sgp1.digitaloceanspaces.com"
    key                         = "prod/terraform.tfstate"
    region                      = "ap-southeast-1"
    secret_key                  = "___CHANGE_ME___"
    skip_credentials_validation = true
    skip_get_ec2_platforms      = true
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
  }
}

module "default-droplet-prod" {
  source                = "../modules/default-app"
  
  count                 = 2
  name                  = "default-app-sgp1-prod"
  pub_key               = "${file("./files/digitalocean-prod.pub")}"
  private_networking    = true
  region                = "sgp1"
}
