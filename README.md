🚀 Strapi Headless CMS Deployment on AWS using Terraform & Docker
Author: Abdul Rahman V A
Project: Strapi Terraform DevOps Task
Cloud Provider: AWS
IaC Tool: Terraform
Container Runtime: Docker
CMS: Strapi v3
Database: PostgreSQL (Docker)
📌 Project Overview

This project demonstrates how to deploy a production-ready Strapi Headless CMS on AWS EC2 using Terraform infrastructure automation and Docker for containerized deployment.

Strapi CMS exposes REST API endpoints for managing content such as blog posts, users, media files, etc.

This project includes:

Fully automated AWS infrastructure using Terraform

EC2 instance to host Strapi CMS

Docker Compose for Strapi + PostgreSQL

Cloud-deployed Strapi admin panel & API endpoints

Public API access with proper role permissions

GitHub repository containing all code


🏗 Architecture
+-------------------------+
|        Terraform        |
|  (Infrastructure as Code)
+-----------+-------------+
            |
            v
+-------------------------+      +---------------+
|      AWS EC2            |<---->| Security Group|
| Amazon Linux 2          |      |   (Port 1337) |
+-----------+-------------+      +---------------+
            |
            v
+------------------------------------+
|          Docker Engine             |
| +--------------------------------+ |
| |  Docker Compose (Strapi + DB) | |
| +--------------------------------+ |
+------------------------------------+

🌐 Live Deployment Links
✔ Strapi Admin Panel

🔗 http://13.233.97.84:1337/admin

✔ Public API Endpoint

🔗 Get All Posts
http://13.233.97.84:1337/posts

🔗 Get Single Post
http://13.233.97.84:1337/posts/1

📁 Repository Structure
├── docker/
│   ├── docker-compose.yml
│   └── env.example
│
├── terraform/
│   ├── main.tf
│   ├── provider.tf
│   ├── variables.tf
│   ├── outputs.tf
│   ├── user-data.sh
│
├── strapi-app/
│   ├── config/
│   ├── extensions/
│   ├── public/
│   ├── package.json
│   ├── Dockerfile
│
├── .gitignore
├── README.md
└── Dockerfile.txt

⚙️ Deployment Workflow
1️⃣ Clone the Repository
git clone https://github.com/rahman5828/pearlthoughts-strapi-terraform-devops-task
cd pearlhoughts-strapi-terraform-devops-task

2️⃣ AWS Setup Requirements

Before running Terraform, ensure:

✔ AWS Account
✔ IAM User with programmatic access
✔ Access Key & Secret Key configured

aws configure

3️⃣ Terraform Deployment
Initialize Terraform
cd terraform
terraform init

Validate configuration
terraform validate

Preview the infrastructure
terraform plan

Deploy using Terraform
terraform apply -auto-approve


Terraform will create:

EC2 instance

Security group

Key pair

IAM role

Attached user-data script to install Docker & run Strapi

4️⃣ User-Data Script (Auto Install)

The EC2 instance automatically:

Installs Docker

Installs Docker Compose

Clones Strapi project

Runs docker-compose up -d

5️⃣ Access Strapi

After Terraform completes, the output shows:

strapi_url = http://YOUR_EC2_PUBLIC_IP:1337


Open it in browser to access:

✔ Admin panel

http://EC2_PUBLIC_IP:1337/admin

✔ API

http://EC2_PUBLIC_IP:1337/posts

📚 Strapi Configuration
Content-Type: Post

Fields created:

Field	Type
title	Text
slug	UID
content	Rich Text
coverImage	Media
publishedAt	Date
author	Relation (User)
Public Permissions

Enabled:

find

findOne

This allows external REST API consumers to fetch posts.

🔒 Security Configuration

Terraform configures:

✔ Security group allowing port 1337
✔ SSH access only from the owner’s IP
✔ EC2 key pair for SSH login



📦 Future Enhancements

🔹 Deploy Strapi behind Nginx reverse proxy
🔹 HTTPS using Let's Encrypt
🔹 Route53 custom domain
🔹 CI/CD with GitHub Actions
🔹 S3 bucket for media uploads
🔹 ECS or EKS container orchestration

🧑‍💻 Author

Abdul Rahman V A
DevOps & Cloud Engineer
GitHub: https://github.com/rahman5828

⭐ If you like this project

Leave a ⭐ on the repo. It motivates keeps me building more DevOps projects!
