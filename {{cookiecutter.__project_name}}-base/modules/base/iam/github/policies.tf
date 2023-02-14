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

// Grants access to S3 bucket with states
data "aws_iam_policy_document" "tf_state_s3" {
  statement {
    actions   = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
    resources = ["arn:aws:s3:::${var.bucket_name}/${var.key_path}"]
    effect    = "Allow"
    sid       = "OfficialBucketObjectActions"
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${var.bucket_name}"]
    effect    = "Allow"
    sid       = "OfficialBucketActions"
  }
  # List of action not from official documentation. TOBE checked WHY it is required
  statement {
    actions = [
      "s3:GetLifecycleConfiguration",
      "s3:GetBucketTagging",
      "s3:GetBucketWebsite",
      "s3:GetBucketLogging",
      "s3:ListBucket",
      "s3:GetAccelerateConfiguration",
      "s3:GetBucketVersioning",
      "s3:GetBucketAcl",
      "s3:GetBucketPolicy",
      "s3:GetReplicationConfiguration",
      "s3:GetBucketObjectLockConfiguration",
      "s3:GetEncryptionConfiguration",
      "s3:GetBucketRequestPayment",
      "s3:GetBucketCORS",
      "s3:GetBucketLocation"
    ]
    resources = ["arn:aws:s3:::${var.bucket_name}"]
    effect    = "Allow"
  }
}

//grants
data "aws_iam_policy_document" "base_user" {
  statement {
    sid = "DefaultProfileAccess"
    actions = [ "iam:*" ]
    resources = [ 
      "arn:aws:iam::${var.account_number}:user/*",
      "arn:aws:iam::${var.account_number}:group/*",
      "arn:aws:iam::aws:policy/*",
      "arn:aws:iam::${var.account_number}:policy/*"
    ]
    effect = "Allow"
  }
}