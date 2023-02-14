output "username" {
  value = aws_iam_user.admin.name
}

output "password" {
  value = aws_iam_user_login_profile.console_access.password
}