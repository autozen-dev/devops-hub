# Terraform AWS Nginx Web Server

This project uses Terraform to provision a publicly accessible AWS EC2
instance and configure it as an Nginx web server. It also creates the VPC,
public subnet, internet gateway, route table, and security group required to
serve a simple web page over HTTP.

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

The infrastructure includes a VPC with a public subnet, internet gateway,
public route table, and security group allowing SSH and HTTP traffic.

## Project structure:

```bash
aws-terraform-web-server/
├── vpc.tf
├── subnet.tf
├── igw.tf
├── route_table.tf
├── sg.tf
├── ec2.tf
├── provider.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── README.md
```
