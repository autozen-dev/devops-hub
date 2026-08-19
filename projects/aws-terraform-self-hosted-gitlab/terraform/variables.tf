# declare default region
variable "aws_region" {
  description = "aws region to deploy resources into"
  type        = string
  default     = "eu-west-2"
}

# ubuntu ami id
variable "ami_id" {
  description = "ami id for ec2 instance"
  type        = string
  default     = "ami-0224ce6f9504665ee"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t3.small"
}

# key pair to enable ssh access to ec2
variable "key_pair" {
  description = "key pair for ec2 instance"
  type        = string
  default     = "arsalan-devops-keypair"
}
