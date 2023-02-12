resource "aws_iam_user" "github_base" {
  name = "github_base"
}

resource "aws_iam_access_key" "github_base" {
  user = aws_iam_user.github_base.name
}

resource "aws_iam_user_group_membership" "github_base" {
  user = aws_iam_user.github_base.name
  groups = [ var.tfstate_group_name, var.groups.base_managers.name]
}