resource "aws_s3_bucket" "tf_state_s3" {
  bucket = var.bucket_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_s3_bucket_versioning" "tf_state_s3_versioning" {
  bucket = aws_s3_bucket.tf_state_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state_s3_encryption" {
  bucket = aws_s3_bucket.tf_state_s3.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
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
