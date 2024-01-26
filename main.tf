resource "aws_s3_bucket" "ics-bucket" {
  bucket = var.ics-test-bucket
}

resource "aws_s3_bucket_ownership_controls" "ics-bucket" {
    bucket = aws_s3_bucket.ics-bucket.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}

resource "aws_s3_bucket_acl" "ics-bucket" {
  depends_on = [aws_s3_bucket_ownership_controls.ics-bucket]

  bucket = aws_s3_bucket.ics-bucket.id
  acl    = var.secure ? "private" : "public-read" 
}

resource "aws_s3_bucket_policy" "ics-bucket" {
  count = var.secure ? 1 : 0
  bucket = aws_s3_bucket.ics-bucket.id
  policy = data.aws_iam_policy_document.secure.json
}

resource "aws_s3_bucket" "ics-log_bucket" {
  count = var.secure ? 1 : 0
  bucket = "${var.ics-test-bucket}-logs"
}

resource "aws_s3_bucket_acl" "log_bucket_acl" {
  count = var.secure ? 1 : 0
  bucket = aws_s3_bucket.ics-log_bucket[0].id
  acl    = "log-delivery-write"
}

resource "aws_s3_bucket_logging" "example" {
  count = var.secure ? 1 : 0
  bucket = aws_s3_bucket.ics-bucket.id
  target_bucket = aws_s3_bucket.ics-log_bucket[0].id
  target_prefix = "log/"
}

data "aws_iam_policy_document" "secure" {
  statement {
      actions = [
        "s3:*"
      ]

      resources = [
        "${aws_s3_bucket.ics-bucket.arn}",
        "${aws_s3_bucket.ics-bucket.arn}/*"
      ]

      principals {
        type = "*"
        identifiers = ["*"]  
      }
        
      condition {
        test = "Bool"
        variable = "aws:SecureTransport"

        values = [
            "false"
        ]
      }
  }
}