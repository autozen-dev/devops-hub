# Project Challenge

## Deploy a web server to AWS using Terraform.

## Goal:

1. Create an EC2 instance using Terraform.
2. Configure a security group for SSH and HTTP access.
3. Use an AWS key pair to access the EC2 instance.
4. Automatically install and configure Nginx.
5. Deploy a simple web page.
6. Output the public IP and website URL using Terraform.

## Everything runs using:

* Terraform.
* AWS.
* Amazon EC2.
* Amazon Linux.
* Nginx.

## Project structure:

```bash
aws-terraform-web-server/
├── ec2.tf
├── security_group.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```
