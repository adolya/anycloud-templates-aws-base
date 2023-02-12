resource "aws_iam_group" "base_managers" {
  name = "BaseManagers"
}

resource "aws_iam_group_policy" "base_user" {
  name   = "BaseUserAccess"
  group  = aws_iam_group.base_managers.name
  policy = data.aws_iam_policy_document.base_user.json
}

data "aws_iam_policy_document" "base_user" {
  statement {
    sid = "DefaultUserProfileAccess"
    actions = [ "iam:*" ]
    resources = [ "arn:aws:iam::${var.account_number}:user/*" ]
    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "base_group" {
  name   = "BaseGroupAccess"
  group  = aws_iam_group.base_managers.name
  policy = data.aws_iam_policy_document.base_group.json
}

data "aws_iam_policy_document" "base_group" {
  statement {
    sid = "DefaultGroupProfileAccess"
    actions = [ "iam:*" ]
    resources = [ "arn:aws:iam::${var.account_number}:group/*" ]
    effect = "Allow"
  }
}

resource "aws_iam_group_policy" "base_policy" {
  name   = "BasePolicyAccess"
  group  = aws_iam_group.base_managers.name
  policy = data.aws_iam_policy_document.base_policy.json
}

data "aws_iam_policy_document" "base_policy" {
  statement {
    actions = [
      "iam:GetPolicy",
      "iam:GetPolicyVersion",
      "iam:ListPolicyVersions"
    ]
    resources = [
      "arn:aws:iam::aws:policy/*",
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "iam:GetPolicy",
      "iam:GetPolicyVersion"
    ]
    resources = [
      "arn:aws:iam::${var.account_number}:policy/*",
    ]
    effect = "Allow"
  }
}