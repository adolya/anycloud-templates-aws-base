resource "aws_iam_user" "github_base" {
  name = "github_base"
}

resource "aws_iam_access_key" "github_base" {
  user = aws_iam_user.github_base.name
}

resource "aws_iam_user_policy" "tf_state_dynamodb_policy" {
  user = aws_iam_user.github_base.name
  name   = "TerraformStateDynamoDbAccess"
  policy = data.aws_iam_policy_document.tf_state_dynamodb.json
}

resource "aws_iam_user_policy" "tf_state_s3_policy" {
  user = aws_iam_user.github_base.name
  name   = "TerraformStateS3Access"
  policy = data.aws_iam_policy_document.tf_state_s3.json
}

resource "aws_iam_user_policy" "iam_policy" {
  user = aws_iam_user.github_base.name
  name   = "BaseUserIamAccess"
  policy = data.aws_iam_policy_document.base_user.json
}

