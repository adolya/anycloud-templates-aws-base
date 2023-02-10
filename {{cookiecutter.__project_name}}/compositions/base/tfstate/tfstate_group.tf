resource "aws_iam_group" "tf_state_managers" {
  name = "TerraformStateManagers"
}

resource "aws_iam_group_policy" "tf_state_dynamodb_policy" {
  group  = aws_iam_group.tf_state_managers.name
  name   = "TerraformStateDynamoDbAccess"
  policy = data.aws_iam_policy_document.tf_state_dynamodb.json
}

resource "aws_iam_group_policy" "tf_state_s3_policy" {
  group  = aws_iam_group.tf_state_managers.name
  name   = "TerraformStateS3Access"
  policy = data.aws_iam_policy_document.tf_state_s3.json
}
