output "admin_user" {
  value = aws_iam_user.admin.name
}

output "admin_user_password" {
  value = aws_iam_user_login_profile.console_access.password
}

output "github_AWS_ACCESS_KEY_ID" {
  value = aws_iam_access_key.github_base_user.id
}

output "github_AWS_SECRET_ACCESS_KEY" {
  value = aws_iam_access_key.github_base_user.secret
}