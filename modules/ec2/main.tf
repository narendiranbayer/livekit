data "aws_ami" "ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical (Ubuntu)
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "this" {
  ami                         = var.ami_id != "" ? var.ami_id : data.aws_ami.ubuntu.id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  vpc_security_group_ids      = [var.sg_id]
  associate_public_ip_address = true
  subnet_id                   = var.subnet_id

  
  user_data = templatefile("${path.module}/userdata.tpl", {
    livekit_key    = var.livekit_key
    livekit_secret = var.livekit_secret
  })
  
  tags = {
    Name = "${var.name_prefix}-ec2"
  }
}
