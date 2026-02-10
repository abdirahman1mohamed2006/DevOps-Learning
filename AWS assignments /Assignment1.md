# AWS VPC Architecture: Public & Private Subnets with NAT

## 📌 Overview
This project demonstrates the design and implementation of a custom AWS Virtual Private Cloud (VPC) built from the ground up. The lab focuses on core AWS networking concepts including VPC configuration, subnet segmentation, routing, and secure access control using least-privilege principles.

The environment separates internet-facing and internal resources while maintaining controlled outbound access for private workloads.

## 🎯 Objectives
The goal of this project is to design and implement a custom AWS VPC that includes:

- A **public subnet** to host internet-facing resources  
- A **private subnet** with no direct internet access  
- An **Internet Gateway** to enable public subnet connectivity  
- A **NAT Gateway** to allow outbound internet access from the private subnet  
- Correctly configured **route tables** to control traffic flow  
- Two **EC2 instances**, one deployed in each subnet  
- **Least-privilege security groups** to enforce secure access controls  

## 🏗 Architecture Overview
- Custom VPC with isolated public and private network segments  
- Public EC2 instance accessible via the internet  
- Private EC2 instance restricted from inbound internet traffic  
- NAT Gateway enabling secure outbound connectivity for private resources  

> _Architecture diagram can be added here_

## 🔐 Security Considerations
- Security Groups follow the **principle of least privilege**  
- Only required ports and sources are permitted  
- Private subnet resources are protected from direct internet exposure  

## 🚀 Skills & Concepts Demonstrated
- AWS VPC design and subnetting  
- Internet Gateway and NAT Gateway configuration  
- Route table management  
- EC2 deployment in segmented networks  
- Cloud networking security best practices  

## 🧠 Learning Outcomes
By completing this project, you gain hands-on experience with:


- Building AWS networks from scratch  
- Implementing secure network segmentation  
- Understanding real-world cloud networking patterns

## Screenshot evidence 

### 1) VPC Details


<img width="1602" height="561" alt="VPC" src="https://github.com/user-attachments/assets/b0eae099-b754-475f-97ff-bece23e0c71e" />

### 2) Subents (Private + Public)

<img width="1588" height="287" alt="SUBNETS" src="https://github.com/user-attachments/assets/d346b99b-2411-4e64-822d-c2a08cf5ab69" />

### 3) NatGateways

<img width="1607" height="387" alt="Natgateways" src="https://github.com/user-attachments/assets/891955da-c504-4add-92c3-642adc70a4af" />

### 4) Internet Gateway
<img width="1588" height="293" alt="Internet Gateway" src="https://github.com/user-attachments/assets/bafa8a92-653b-4cc9-91dd-1199f39d33c9" />

## 5) Elastic Ip
<img width="1608" height="213" alt="ElasticIP" src="https://github.com/user-attachments/assets/4de62656-9fb1-4bda-bbcd-e5a9965b4232" />


### 6) Security Groups

<img width="1550" height="270" alt="image" src="https://github.com/user-attachments/assets/65a3e4bc-60e0-4f3f-9994-b5fda0446b30" />

### 7) Public Route Table (IGW route + association)
<img width="1571" height="637" alt="Public Subnet" src="https://github.com/user-attachments/assets/0917df15-ffd7-4960-be9d-16e276285459" />

### 8) Private Route Table (NAT route + association)
<img width="1573" height="650" alt="Private Subnets " src="https://github.com/user-attachments/assets/81b9cea5-27fa-4bb1-980f-db12951517c2" />


### 9) public and private EC2s
<img width="1555" height="745" alt="Public Instances" src="https://github.com/user-attachments/assets/fc24fd25-66e2-49b7-a0a4-66bf7408f236" />
<img width="1535" height="737" alt="Private Instance" src="https://github.com/user-attachments/assets/54148277-cd32-49fb-8b19-c32d26d51381" />

#### Diagram


<img width="1536" height="1024" alt="ChatGPT Image Feb 10, 2026, 02_29_47 PM" src="https://github.com/user-attachments/assets/94d530f0-e596-443c-9d5c-f98ba9e7bc65" />






