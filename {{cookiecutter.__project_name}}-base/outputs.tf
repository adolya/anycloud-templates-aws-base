output "base_info" {
  value = { 
    administrators = module.admins.users
    github = module.github.users
  }
  sensitive = true
}