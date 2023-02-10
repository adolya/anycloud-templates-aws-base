resource "aws_iam_user" "github_base" {
  name = "github_base"
}

resource "aws_iam_access_key" "github_base_user" {
  user = aws_iam_user.github_base.name
}

resource "aws_iam_user_group_membership" "github_base_user" {
  user = aws_iam_user.github_base.name
  groups = var.github_user_groups
}