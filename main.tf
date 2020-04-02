variable "environment" {}

provider "aws" {
    region = "us-east-1"
}

terraform {
  backend "s3" {}
}

resource "aws_s3_bucket" "lambda_bucket" {
    bucket = "mscripts-lambdas-${var.environment}"
    acl = "private"
    versioning {
        enabled = true
    }
    tags = {
        Name = "mscripts-lambdas-${var.environment}"
        Environment = var.environment
    }
}

output "bucket_id" {
    value = aws_s3_bucket.lambda_bucket.id
}

output "bucket_arn" {
    value = aws_s3_bucket.lambda_bucket.arn
}