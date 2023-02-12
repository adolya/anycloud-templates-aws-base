resource "aws_iam_group" "admins" {
  name = "Administrators"
}

resource "aws_iam_group_policy_attachment" "admin_full_access" {
  group      = aws_iam_group.admins.name
  policy_arn =  "arn:aws:iam::aws:policy/AdministratorAccess"
}

