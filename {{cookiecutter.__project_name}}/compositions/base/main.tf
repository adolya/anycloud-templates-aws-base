module "policies" {
  source = "./iam/policies"
}

module "users" {
  source = "./iam/users"
  github_user_groups = [
    module.tf_state.tf_state_group.name,
    module.groups.base_managers.name
  ]
  admin_user_name  = var.admin_user_name
  admin_policy_arn = module.policies.standard_policies.admin_full_access.arn
}

module "groups" {
  source            = "./iam/groups"
  account_number    = var.account_number
  table_name        = var.table_name
  bucket_name       = var.bucket_name
  key_path          = var.key_path
  tf_state_managers = module.tf_state.tf_state_group.name
  standard_policies = module.policies.standard_policies
}

module "tf_state" {
  source      = "./tfstate"
  table_name  = var.table_name
  bucket_name = var.bucket_name
  key_path    = var.key_path
}
