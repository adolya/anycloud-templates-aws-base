resource "aws_iam_group" "admins" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "admin_full_access" {
  group      = aws_iam_group.admins.name
  policy_arn =  "arn:aws:iam::aws:policy/AdministratorAccess"
}

module "users" {
  source = "./users"
  for_each = toset(var.admin_user_names)
  admin_user_name = each.value
  admins_group = aws_iam_group.admins.name
}