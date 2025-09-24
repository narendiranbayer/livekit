# All values to be provided in terraform.tfvars

variable "aws_region" {
  type        = string
  description = "AWS region"
}

# variable "tfstate_s3_bucket" {
#   type        = string
#   description = "(optional) S3 bucket for remote state"
# }

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for public subnet"
}

variable "availability_zone" {
  type        = string
  description = "AZ to create the subnet in (example: ap-south-1a)"
}

variable "key_name" {
  type        = string
  description = "EC2 Key pair name in AWS (do not put PEM contents here)"
}

variable "allowed_ssh_cidr" {
  type        = string
  description = "CIDR allowed to SSH and for dev frontend access (your IP/32 recommended)"
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
}

variable "livekit_api_key" {
  type        = string
  description = "LiveKit API key (POC) - placed in livekit.yaml"
}

variable "livekit_api_secret" {
  type        = string
  description = "LiveKit API secret (POC) - placed in livekit.yaml"
}

variable "ami_id" {
  type        = string
  description = "Optional AMI id for the EC2 (leave empty to use latest Ubuntu)"
  default     = ""
}

