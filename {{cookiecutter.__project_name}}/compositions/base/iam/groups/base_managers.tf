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
    actions = [
      "iam:*"
    ]
    resources = [
      "arn:aws:iam::${var.account_number}:user/*",
    ]
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
    actions = [
      "iam:GetGroup",
      "iam:GetGroupPolicy",
      "iam:DeleteGroupPolicy",
      "iam:RemoveUserFromGroup",
      "iam:CreateGroup",
      "iam:DeleteGroup",
      "iam:ListAttachedGroupPolicies"
    ]
    resources = [
      "arn:aws:iam::${var.account_number}:group/${aws_iam_group.base_managers.name}"
    ]
    effect = "Allow"
  }
  statement {
    actions = [
      "iam:GetGroup",
      "iam:GetGroupPolicy",
      "iam:ListAttachedGroupPolicies",
      "iam:DetachGroupPolicy",
      "iam:PutGroupPolicy",
      "iam:RemoveUserFromGroup",
      "iam:DeleteGroupPolicy"
    ]
    resources = [
      "arn:aws:iam::${var.account_number}:group/${var.tf_state_managers}"
    ]
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

resource "aws_iam_group_policy" "base_dynamo" {
  name   = "BaseDynamoDbAccess"
  group  = aws_iam_group.base_managers.name
  policy = data.aws_iam_policy_document.base_dynamo.json
}

data "aws_iam_policy_document" "base_dynamo" {
  statement {
    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:DescribeTimeToLive",
      "dynamodb:DescribeContinuousBackups",
      "dynamodb:ListTagsOfResource",
      "dynamodb:DeleteTable"
    ]
    resources = [
      "arn:aws:dynamodb:*:${var.account_number}:table/${var.table_name}"
    ]
    effect = "Allow"
  }
}

resource "aws_iam_group_policy_attachment" "base_s3" {
  group      = aws_iam_group.base_managers.name
  policy_arn = var.standard_policies.s3_full_access.arn
}
