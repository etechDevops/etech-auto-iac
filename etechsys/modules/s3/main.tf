terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.31.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"
  version = "3.15.0"

  bucket = var.bucket_name
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = (var.env == "prod") ? true:false
  }

#   lifecycle_rule = {
#     deletion_protection = true
#   }
}