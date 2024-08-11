provider "aws" {
  region = var.aws_region
}
#Prerequisite: Create the S3 Bucket Manually or via AWS CLI
#need to create the S3 bucket before running Terraform. The Terraform backend configuration tells Terraform where to store the state files that keep track of your infrastructure resources.
#using AWS CLI: aws s3api create-bucket --bucket your-unique-bucket-name --region us-east-1

terraform {
  backend "s3" {
    bucket = "bucket-unique"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}