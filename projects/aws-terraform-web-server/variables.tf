variable "aws_region" {
  description = "AWS region to deploy resources into"
  type        = string
  default     = "eu-west-2"
}

variable "ami_id" {
  description = "ami id for ec2 instance"
  type        = string
  default     = "ami-0224ce6f9504665ee"
}

variable "key_pair" {
  description = "key pair for ec2 instance"
  type        = string
  default     = "arsalan-devops-keypair"
}