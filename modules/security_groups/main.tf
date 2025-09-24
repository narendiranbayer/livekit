resource "aws_security_group" "this" {
  name        = "${var.name_prefix}-sg"
  description = "Security group for LiveKit"
  vpc_id      = var.vpc_id

  # SSH
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "SSH"
  }

  # Frontend dev port
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [var.allowed_ssh_cidr]
    description = "Frontend dev"
  }

  # LiveKit HTTP
  ingress {
    from_port   = 7880
    to_port     = 7880
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "LiveKit HTTP"
  }

  # LiveKit realtime TCP (optional)
  ingress {
    from_port   = 7881
    to_port     = 7881
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "LiveKit realtime TCP"
  }

  # STUN/TURN UDP
  ingress {
    from_port   = 3478
    to_port     = 3478
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "STUN/TURN UDP"
  }

  # RTP/RTCP UDP range
  ingress {
    from_port   = 50000
    to_port     = 50010
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "RTP UDP range"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "${var.name_prefix}-sg" }
}
