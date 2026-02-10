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

