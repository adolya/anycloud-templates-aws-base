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