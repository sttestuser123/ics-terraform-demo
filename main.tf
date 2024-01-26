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
  acl    = var.public ? "public-read" : "private"
}
