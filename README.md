
# Terraform ALB and Route 53 Project

## Project Overview

This project demonstrates how to build AWS infrastructure using Terraform modules.

The project includes a VPC, EC2 instance, Application Load Balancer (ALB), and Route 53 DNS configuration.

## Architecture

The infrastructure is organized into the following components:

1. **VPC** – Creates a Virtual Private Cloud with public subnets.
2. **Internet Gateway** – Provides internet connectivity to the public subnets.
3. **EC2** – Hosts the application.
4. **Application Load Balancer (ALB)** – Distributes incoming HTTP traffic to the EC2 instance.
5. **Route 53** – Creates an alias DNS record pointing to the ALB.

## Project Structure

```text
terraform-task/
│
├── .github/
│   └── workflows/
│       └── terraform.yml
│
├── modules/
│   ├── VPC/
│   ├── EC2/
│   ├── ALB/
│   ├── route53/
│   └── s3/
│
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
└── README.md
```

## Tools Used

- Terraform
- AWS
- GitHub
- GitHub Actions

## CI Workflow

GitHub Actions is used to automatically check the Terraform configuration.

The workflow performs:

- Terraform formatting checks
- Terraform initialization
- Terraform validation
- Terraform dependency graph generation

## Important Notes

- This project is currently for learning and practice.
- The GitHub Actions workflow validates the Terraform code only.
- Terraform `plan` and `apply` are not executed.
- No AWS infrastructure is created by the CI workflow.
- Route 53 requires an existing hosted zone and domain name.
- Deploying AWS resources such as ALB, EC2, and Route 53 may incur charges.

## Learning Objective

Understand how to organize Terraform using modules and configure an Application Load Balancer with Route 53 DNS integration.
