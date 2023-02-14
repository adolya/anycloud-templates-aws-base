output "admin_user" {
  value = aws_iam_user.admin.name
}

output "admin_user_password" {
  value = aws_iam_user_login_profile.console_access.password
}

output "github" {
  value = {
    base = {
      AWS_ACCESS_KEY_ID = aws_iam_access_key.github_base.id
      AWS_SECRET_ACCESS_KEY = aws_iam_access_key.github_base.secret
    }
  }
}