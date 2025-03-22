resource "aws_s3_bucket" "s3-bucket" {
  bucket = "${local.env}-0123456-s3-bucket"

  tags = {
    Name        = "${local.env}-0123456-s3-bucket" ## Adding numbers for unique name
  }
}
