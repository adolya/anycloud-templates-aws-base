output "users" {
  value = {
    base = {
      AWS_ACCESS_KEY_ID = aws_iam_access_key.github_base.id
      AWS_SECRET_ACCESS_KEY = aws_iam_access_key.github_base.secret
    }
  }
}