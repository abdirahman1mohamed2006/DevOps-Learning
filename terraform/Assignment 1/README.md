# 🚀 Deploying WordPress on AWS using Terraform

## 📌 Objective

The objective of this project is to use **Terraform (Infrastructure as Code)** to deploy a fully functional WordPress stack on AWS.

This project demonstrates how Terraform provisions and manages real cloud infrastructure end-to-end without manually configuring resources in the AWS Console.

---

## 🏗️ Infrastructure Overview

This Terraform configuration provisions:

- An **EC2 instance** running Ubuntu
- A **Security Group** allowing SSH, HTTP, and HTTPS
- A **user data script** to automatically install:
  - Apache
  - PHP
  - MariaDB (MySQL)
  - WordPress
- A publicly accessible **WordPress website**
- All resources managed entirely through Terraform

No manual server setup was performed — everything is automated.

---

## 🧠 Architecture

This deployment follows a simple 2-tier architecture:

### Web Layer
- Apache Web Server
- PHP Runtime
- WordPress Application

### Database Layer
- MariaDB running on the same EC2 instance
- WordPress connects to this database

All infrastructure is deployed in the `eu-west-1` AWS region by default.

---

# 🚀 Deploying WordPress on AWS using Terraform

## 📌 Project Objective

In this project, I used **Terraform** to provision a complete WordPress environment on AWS.

The goal was to demonstrate how Infrastructure as Code (IaC) can automate the creation of cloud infrastructure and deploy a working web application without manually configuring servers.

---

## 🛠️ What I Built

Using Terraform, I:

- Configured the **AWS provider**
- Created a **Security Group** to allow SSH, HTTP, and HTTPS traffic
- Dynamically retrieved the latest **Ubuntu AMI**
- Launched an **EC2 instance**
- Injected a **user data script** to automatically:
  - Install Apache
  - Install PHP
  - Install MariaDB (MySQL)
  - Download and configure WordPress
- Generated a working **public endpoint**
- Output the public IP and URL directly from Terraform

Everything was provisioned and configured using code — no manual setup inside the EC2 instance.



---




