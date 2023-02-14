module "iam" {
  source          = "./iam"
  admin_user_name = var.admin_user_name
  account_number  = var.account_number
  tfstate_group_name  = module.tf_state.tf_state_group.name
}

module "tf_state" {
  source         = "./tfstate"
  table_name     = var.table_name
  bucket_name    = var.bucket_name
  key_path       = var.key_path
  account_number = var.account_number
}
