resource "aws_iam_group" "admins" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "admin_full_access" {
  group      = aws_iam_group.admins.name
  policy_arn =  "arn:aws:iam::aws:policy/AdministratorAccess"
}


resource "aws_iam_user" "admin" {
  name = var.admin_user_name
}

resource "aws_iam_user_group_membership" "admin_groups_membership" {
  user = aws_iam_user.admin.name
  groups = [aws_iam_group.admins.name]
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
