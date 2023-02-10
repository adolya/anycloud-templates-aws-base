output "base_info" {
  value = module.terraform_base.base_users
  sensitive = true
}

module "terraform_base" {
  source          = "./compositions/base"
  bucket_name     = "terraform-state-{{cookiecutter.__project_name}}-base"
  key_path        = "base.tfstate"
  table_name      = "terraform-{{cookiecutter.__project_name}}-locks"
  admin_user_name = "{{ cookiecutter.admin_name}}"
  account_number  = "{{ cookiecutter.account_number}}"
}
