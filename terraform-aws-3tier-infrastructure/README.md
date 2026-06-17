# Terraform AWS 3-Tier Infrastructure Project

## Project Overview

This project demonstrates the provisioning of a complete AWS-based 3-tier infrastructure using Terraform (Infrastructure as Code).

The infrastructure is deployed entirely through Terraform without manual resource creation in the AWS Console. The project provisions networking components, compute resources, security controls, database infrastructure, and automated server configuration.

The objective of this project is to demonstrate Infrastructure as Code (IaC), AWS networking fundamentals, automation, and Terraform best practices commonly used in DevOps environments.

---

# Architecture

```text
                         Internet
                             │
                             ▼
                   Internet Gateway
                             │
                             ▼
                     Public Subnet
                             │
                             ▼
                     EC2 Web Server
                     (Amazon Linux)
                             │
                             ▼
                     Security Group
                             │
            ┌────────────────┴────────────────┐
            │                                 │
            ▼                                 ▼
   Private Application Subnet      Private Database Subnet
                                            │
                                            ▼
                                      RDS MySQL
```

---

# Architecture Components

## Networking

### VPC

* CIDR: 10.0.0.0/16
* Provides isolated networking environment

### Public Subnet

* CIDR: 10.0.1.0/24
* Hosts internet-facing EC2 instance
* Automatically assigns public IP addresses

### Private Application Subnet

* CIDR: 10.0.2.0/24
* Reserved for internal application resources

### Private Database Subnet

* CIDR: 10.0.3.0/24
* Used by Amazon RDS

### Internet Gateway

Provides internet connectivity to resources located in the public subnet.

### Route Table

Routes outbound traffic (0.0.0.0/0) through the Internet Gateway.

---

# Compute Layer

## EC2 Web Server

* Amazon Linux 2023
* Instance Type: t3.micro
* Provisioned using Terraform
* Configured automatically through User Data

### Automated Configuration
During instance startup:

* Apache HTTP Server is installed
* Apache service is enabled
* Apache service is started
* Default web page is created

No manual configuration is required after deployment.

---

# Database Layer

## Amazon RDS MySQL

* Engine: MySQL
* Private subnet deployment
* Accessible only from approved security groups
* Not publicly accessible

### Security Benefit

The database is isolated from direct internet access and can only be reached from resources inside the VPC.

---

# Security

## Web Security Group

Allows:

| Protocol | Port | Purpose |
| -------- | ---- | ------- |
| TCP      | 22   | SSH     |
| TCP      | 80   | HTTP    |

## Database Security Group

Allows:

| Protocol | Port | Source             |
| -------- | ---- | ------------------ |
| TCP      | 3306 | EC2 Security Group |

This ensures only the application layer can communicate with the database.

---

# SSH Key Management

Terraform provisions and manages the AWS Key Pair used for EC2 access.

Benefits:

* Secure instance access
* Infrastructure managed through code
* Repeatable deployments

---

# Terraform Resources Used

The project provisions the following AWS resources:

* aws_vpc
* aws_subnet
* aws_internet_gateway
* aws_route_table
* aws_route_table_association
* aws_security_group
* aws_key_pair
* aws_instance
* aws_db_subnet_group
* aws_db_instance

---

# Project Structure

```text
terraform-aws-3tier-app/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── README.md
├── architecture.png
│
├── screenshots/
│   ├── website.png
│   ├── ec2.png
│   ├── rds.png
│   └── terraform-apply.png
│
└── .github/
    └── workflows/
        └── terraform.yml
```

---

# Deployment Steps

## Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/terraform-aws-3tier-app.git

cd terraform-aws-3tier-app
```

## Initialize Terraform

```bash
terraform init
```

## Validate Configuration

```bash
terraform validate
```

## Review Infrastructure Plan

```bash
terraform plan
```

## Deploy Infrastructure

```bash
terraform apply
```

## Destroy Infrastructure

```bash
terraform destroy
```

---

# Terraform Outputs

After deployment:

```bash
terraform output
```

Example:

```text
web_public_ip = 3.x.x.x

rds_endpoint = terraform-db.xxxxxx.ap-south-1.rds.amazonaws.com
```

---

# Screenshots

## Website

Add screenshot showing successful website deployment.

![Website](screenshots/website.png)

---

## EC2 Instance

Add AWS EC2 console screenshot.

![EC2](screenshots/ec2.png)

---

## RDS Instance

Add AWS RDS console screenshot.

![RDS](screenshots/rds.png)

---

## Terraform Apply

Add successful Terraform deployment screenshot.

![Terraform Apply](screenshots/terraform-apply.png)

---

# Key Learnings

Through this project I gained hands-on experience with:

* Infrastructure as Code (IaC)
* Terraform fundamentals
* AWS networking
* EC2 provisioning
* RDS deployment
* Security Groups
* Route Tables
* User Data automation
* SSH Key Pair management
* Infrastructure lifecycle management

---

# Future Enhancements

Planned improvements:

* Remote Terraform State using Amazon S3
* DynamoDB State Locking
* Multi-AZ Architecture
* Application Load Balancer
* Auto Scaling Group
* GitHub Actions CI/CD Pipeline
* Dockerized Application Deployment
* Monitoring with Prometheus and Grafana

---

# Author

Kalyan

DevOps Engineer (Aspiring)

AWS | Terraform | Docker | Kubernetes | Linux | CI/CD

