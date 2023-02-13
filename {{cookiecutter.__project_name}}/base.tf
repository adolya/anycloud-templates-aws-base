output "base_info" {
  value = module.terraform_base.base_users
  sensitive = true
}

module "terraform_base" {
  source          = "./compositions/base"
  bucket_name     = "{{ cookiecutter.__bucket_name}}"
  key_path        = "states/base.tfstate"
  table_name      = "{{ cookiecutter.__dynamo_table_name}}"
  admin_user_name = "{{ cookiecutter.admin_name}}"
  account_number  = "{{ cookiecutter.account_number}}"
}
