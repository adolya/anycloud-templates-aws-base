resource "aws_iam_user" "admin" {
  name = var.admin_user_name
}

resource "aws_iam_user_group_membership" "admin_groups_membership" {
  user = aws_iam_user.admin.name
  groups = [var.admins_group]
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