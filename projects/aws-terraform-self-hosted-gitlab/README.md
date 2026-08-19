# Terraform AWS Self Hosted GitLab Instance

This project uses Terraform to provision a self-hosted GitLab instance on AWS.
It creates an EC2 server, public VPC networking, a dedicated EBS data volume,
and a security group for SSH and HTTP access. The EC2 user data script installs
Docker and runs GitLab Community Edition in a container.

## Goals

1. Provision an AWS EC2 instance for GitLab.
2. Create a public VPC, subnet, internet gateway, and route table.
3. Attach persistent EBS storage for GitLab configuration, logs, and data.
4. Install Docker and GitLab automatically using EC2 user data.
5. Expose GitLab over HTTP.

## Access GitLab

After Terraform finishes creating the instance, connect to it over SSH and
check the installation locally:

```bash
curl http://localhost
```

You can also open `http://localhost` in a browser running on the EC2 instance.
GitLab may take several minutes to initialize after Docker starts.

To get the public URL from Terraform:

```bash
terraform -chdir=terraform output gitlab_url
```

Open the resulting URL from your local computer. The public IP must be tested
from outside the EC2 instance; `localhost` refers to the EC2 machine itself.

Useful bootstrap checks over SSH:

```bash
sudo cloud-init status --long
sudo tail -f /var/log/install-gitlab.log
sudo docker ps
```

## Project Structure

```text
aws-terraform-self-hosted-gitlab/
├── terraform/
│   ├── ec2.tf
│   ├── igw.tf
│   ├── output.tf
│   ├── provider.tf
│   ├── route_table.tf
│   ├── route_table_association.tf
│   ├── sg.tf
│   ├── subnet.tf
│   ├── variables.tf
│   └── vpc.tf
├── scripts/
│   └── install-gitlab.sh
└── README.md
```

