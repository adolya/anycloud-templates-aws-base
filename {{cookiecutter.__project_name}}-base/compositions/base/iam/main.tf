
module "groups" {
  source         = "./groups"
  account_number = var.account_number
}

module "users" {
  source = "./users"
  admin_user_name = var.admin_user_name
  groups = module.groups
  tfstate_group_name = var.tfstate_group_name
}
