output "users" {
  value = {
     for k, v in module.users : k => v.password
  }
}