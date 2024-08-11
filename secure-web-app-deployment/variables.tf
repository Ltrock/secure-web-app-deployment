# variables.tf
variable "aws_region" {
  description = "The AWS region where resources will be created."
  default     = "us-east-1"
}

variable "project_name" {
  description = "The name of the project."
  default     = "secure-webapp"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet."
  default     = "10.0.1.0/24"
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "Amazon Machine Image (AMI) ID for the EC2 instance"
  default     = "ami-00402f0bdf4996822"
}
