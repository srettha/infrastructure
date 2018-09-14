# Terraform usage

## Basic usage

- plan

- apply

- destroy

## Digitalocean requirements

- To run terraform for `Digitalocean`, It's required to have `$DIGITALOCEAN_TOKEN` in either `.bash_profiles` or `.zshrc`

- `Digitalocean` will save `terraform.tfstate` on `Digitalocean spaces`, which is required `$SPACE_ACCESS_KEY` and `$SPACE_SECRET_KEY`.

- It's required to have public key inside `<env>/files/digitalocean-<env>.pub`

  e.g.

  - `prod/files/digitalocean-prod.pub`

  - `staging/files/digitalocean-staging.pub`

### Staging

```bash
./terraform.sh -p staging -d digitalocean/staging -c plan

./terraform.sh -p staging -d digitalocean/staging -c apply

./terraform.sh -p staging -d digitalocean/staging -c destroy
```

### Production

```bash
./terraform.sh -p prod -d digitalocean/prod -c plan

./terraform.sh -p prod -d digitalocean/prod -c apply

./terraform.sh -p prod -d digitalocean/prod -c destroy
```
