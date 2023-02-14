locals {
  bucket_name = "{{ cookiecutter.__bucket_name }}"
  table_name = "{{ cookiecutter.__dynamo_table_name }}"
}

module "terraform_base" {
  source          = "./modules/base/tfstate"
  table_name      = local.table_name
  bucket_name     = local.bucket_name
}

module "admins" {
  source          = "./modules/base/iam/admins"
  admin_user_names = ["{{ cookiecutter.admin_name }}"]
}

module "github" {
  source          = "./modules/base/iam/github"
  table_name      = local.table_name
  bucket_name     = local.bucket_name
  key_path        = "{{ cookiecutter.__state_location }}"
  account_number  = "{{ cookiecutter.account_number }}"
}