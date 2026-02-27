variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "eu-west-1"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_name" {
  type        = string
  description = "Existing AWS key pair name (for SSH)"
}

variable "ssh_cidr" {
  type        = string
  description = "Your IP in CIDR form for SSH access (recommended: your public IP /32)"
  default     = "0.0.0.0/0"
}
