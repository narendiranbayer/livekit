variable "name_prefix" { type = string }
variable "subnet_id" { type = string }
variable "sg_id" { type = string }
variable "key_name" { type = string }
variable "instance_type" { type = string }
variable "ami_id" { type = string }
variable "rendered_livekit" { type = string }
variable "livekit_key" {
  type        = string
  description = "API key for LiveKit"
}

variable "livekit_secret" {
  type        = string
  description = "API secret for LiveKit"
}