resource "aws_iam_user" "admin" {
  name = var.admin_user_name
}

resource "aws_iam_user_policy_attachment" "admin_user_policy" {
  user       = aws_iam_user.admin.name
  policy_arn = var.admin_policy_arn
}

resource "aws_iam_user_login_profile" "console_access" {
  user                    = aws_iam_user.admin.name
  password_reset_required = true

  lifecycle {
    ignore_changes = [
      password_length,
      password_reset_required,
      pgp_key,
    ]
  }
}
