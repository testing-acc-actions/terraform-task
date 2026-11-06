
# Terraform Practice Project

This repository is part of my hands-on learning journey with Terraform and AWS.

The goal of this project is to understand how Terraform works with modules, providers, variables, and outputs.

## What This Project Does

- Configures the AWS provider.
- Creates an AWS VPC configuration using a reusable module.
- Exports the VPC ID through Terraform outputs.
- Uses GitHub Actions to check Terraform formatting and validate the configuration.

## Project Structure

```text
terraform-task/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── backend.tf
├── modules/
│   └── VPC/
│       ├── Vpc.tf
│       └── outputs.tf
└── .github/
    └── workflows/
        └── terraform.yml
```

## Tools Used

- Terraform
- AWS Provider
- GitHub
- GitHub Actions

## GitHub Actions

The workflow runs these checks:

1. Checks out the repository.
2. Installs Terraform.
3. Checks Terraform formatting.
4. Initializes Terraform without a backend.
5. Validates the Terraform configuration.

## Important Note

This project currently focuses on Terraform formatting, initialization, and validation.

It does not deploy AWS resources through GitHub Actions.

AWS credentials are required for operations such as planning against the AWS provider and deploying infrastructure.

## Learning Goals

- Understand Terraform configuration.
- Learn how to create and use modules.
- Understand Terraform variables and outputs.
- Practise Infrastructure as Code.
- Automate Terraform checks using GitHub Actions.
