terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
# Stores the terraform state file in S3
  backend "s3" {
    bucket  = "terraform-state-bucket-dm"
    key     = "terraform.tfstate.dev"
    region  = "us-east-1"
    profile = "terraform-user"
  }
}

# Configure the AWS Provider
provider "aws" {
    region  = "us-east-1"
    profile = "terraform-user"
}
