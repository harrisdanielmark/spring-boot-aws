resource "aws_s3_bucket" "images-bucket" {
    bucket = "dharris-aws-demo-images"
    acl = "private"

    tags {
        Name = "dharris-aws-demo-images-1"
        Environment = "Dev"
    }
}