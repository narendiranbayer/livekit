# --- MUST EDIT THESE VALUES ---

aws_region        = "us-east-1"
#tfstate_s3_bucket = "bayer-livekit-backend"                 # optional: set if you want remote S3 backend

# VPC & Subnet
vpc_cidr          = "10.0.0.0/16"
public_subnet_cidr = "10.0.1.0/24"
availability_zone = "us-east-1a"

# EC2 access
key_name          = "livekit-123"          # <<-- set to your existing keypair name in the region
allowed_ssh_cidr  = "0.0.0.0/0"        # for demo; replace with your.IP/32 for security

# EC2 instance
instance_type     = "t3.small"
ami_id            = ""                 # leave empty to use latest Ubuntu in region

# LiveKit API keys (POC)
livekit_api_key    = "demo_key_abc123"
livekit_api_secret = "demo_secret_abc123!ChangeMe"

