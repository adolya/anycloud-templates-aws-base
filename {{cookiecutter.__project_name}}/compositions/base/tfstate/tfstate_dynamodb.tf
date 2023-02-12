resource "aws_dynamodb_table" "tf_table_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
}

// Grants access to DynamoDb Table with locks
data "aws_iam_policy_document" "tf_state_dynamodb" {
  statement {
    actions = [
      "dynamodb:GetItem",
      "dynamodb:PutItem",
      "dynamodb:DeleteItem",
      "dynamodb:DescribeTable",
      "dynamodb:DescribeContinuousBackups",
      "dynamodb:DescribeTimeToLive",
      "dynamodb:ListTagsOfResource"
    ]
    resources = ["arn:aws:dynamodb:*:${var.account_number}:table/${var.table_name}"]
    effect    = "Allow"
  }
}