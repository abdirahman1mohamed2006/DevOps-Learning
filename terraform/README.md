## What is Infrastructure as Code (IaC)?

Terraform falls under the category of Infrastructure as Code (IaC). Before diving deeper into Terraform itself, it’s important to understand the concept behind it.

Infrastructure as Code is the practice of managing and provisioning cloud resources using code instead of manually clicking through a cloud provider’s dashboard. Instead of configuring servers, networks, and storage by hand, we define everything in configuration files. This approach increases consistency, automation, scalability, and reliability compared to manual provisioning.

---

## What is Terraform?

Terraform is an Infrastructure as Code tool developed by HashiCorp. More specifically, it is an infrastructure orchestration tool. That distinction is important.

Infrastructure orchestration tools define and provision infrastructure components such as EC2 instances, VPCs, subnets, and security groups.

Configuration management tools (like Ansible) focus on configuring what runs inside existing infrastructure — for example, installing software on a server.

Terraform is cloud-agnostic, meaning it works across multiple cloud providers such as AWS, Azure, and Google Cloud. This makes it more flexible than tools like AWS CloudFormation, which are limited to a single provider.

---

## Benefits of using Terraform

Terraform offers several key advantages:

### Idempotency

Terraform ensures that infrastructure is only created or modified when necessary. If part of the infrastructure already exists, Terraform will not duplicate it. Instead, it intelligently updates only what has changed.

### Reusability

Because infrastructure is written as code, configurations can be reused across multiple environments and projects. This promotes consistency and reduces repetition.

### Readability

Infrastructure written in code can be structured, documented, and parameterised using variables. This improves clarity and makes projects easier to understand and maintain.

---

## The Terraform State

Terraform uses a state file to track infrastructure. This is one of its most important concepts.

The state file maps Terraform’s configuration to the actual infrastructure deployed in the cloud. It allows Terraform to understand what already exists and what needs to change.

There are two key ideas:

### Current State

This reflects the infrastructure that Terraform has already created. It is stored in a file ending in `.tfstate`.

### Desired State

This represents what is defined in your `.tf` configuration files — the infrastructure you want to exist.

When you run Terraform, it compares the desired state (your code) with the current state (what exists). It then makes the necessary adjustments so that the current infrastructure matches the desired configuration.

---

## Terraform Backend

The backend determines where the Terraform state file is stored.

There are two primary backend types:

### Local Backend

In this setup, the state file is stored on your local machine. This works well for individual projects or learning environments but becomes problematic in team settings.

### Remote Backend

A remote backend stores the state file in a shared location, such as Amazon S3. This provides a single source of truth for the infrastructure and allows teams to collaborate safely.

Without a remote backend, multiple team members could accidentally overwrite each other’s state files.

---

## State-Locking

When multiple people work on the same infrastructure, there is a risk that two users might attempt to modify the state file simultaneously. This can lead to corruption or inconsistent infrastructure.

State-locking prevents this issue by temporarily locking the state file while Terraform is making changes.

On AWS, state-locking is commonly implemented using DynamoDB alongside an S3 backend. Recently, native S3 locking has also been introduced, removing the need for DynamoDB and simplifying the setup.

---

## Variables

In software development, there is a principle called DRY — Don’t Repeat Yourself.

Terraform supports this concept through variables, allowing repeated values to be defined once and reused throughout the configuration.

There are two main types of variables:

### Input Variables

These allow users to supply values when deploying infrastructure. They are commonly defined in `variables.tf`.

### Output Variables

These display values after infrastructure is created, such as public IP addresses or resource IDs. They are typically defined in `outputs.tf`.

Sensitive data can be stored in `.tfvars` files, which can be excluded from version control using `.gitignore` to prevent exposing secrets.

---

## Modules

Modules are reusable building blocks in Terraform. They allow infrastructure to be organised into logical components.

Instead of placing all resources in one directory, modules allow you to separate infrastructure into categories such as:

- EC2
- VPC
- S3
- Load Balancers

This improves organisation, scalability, and maintainability, especially in larger projects.

---

## Creating Infrastructure with Terraform

Once the configuration is written, Terraform uses a simple workflow to deploy infrastructure.

The key commands are:

### terraform init

Initialises the working directory. It downloads the required provider plugins and sets up the backend. This must be run before other commands.

### terraform plan

Creates an execution plan. It shows what Terraform intends to create, modify, or delete before any changes are made.

### terraform apply

Executes the changes defined in the plan and provisions the infrastructure in the cloud.

This workflow ensures that infrastructure changes are predictable, reviewable, and controlled.
