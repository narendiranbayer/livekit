locals {
  name_prefix = "livekit"
}

# Render livekit.yaml using templatefile and values from terraform.tfvars
locals {
  rendered_livekit = templatefile("${path.module}/templates/livekit.yaml.tpl", {
    api_key    = var.livekit_api_key
    api_secret = var.livekit_api_secret
  })
}

# Create VPC + Subnet
module "vpc" {
  source = "./modules/vpc"

  vpc_cidr           = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
  az                 = var.availability_zone
  name_prefix        = local.name_prefix
}

# Create Security Group
module "sg" {
  source = "./modules/security_groups"

  vpc_id           = module.vpc.vpc_id
  name_prefix      = local.name_prefix
  allowed_ssh_cidr = var.allowed_ssh_cidr
}

# Create EC2 and hand-over rendered config
module "ec2" {
  source = "./modules/ec2"

  name_prefix       = local.name_prefix
  subnet_id         = module.vpc.public_subnet_id
  sg_id             = module.sg.sg_id
  key_name          = var.key_name
  instance_type     = var.instance_type
  ami_id            = var.ami_id
  rendered_livekit  = local.rendered_livekit
  livekit_key    = var.livekit_api_key
  livekit_secret = var.livekit_api_secret
}
