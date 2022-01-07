variable "environment" {
  type = string
}
variable "ebs_optimized" {
  type = bool
  default = true
}
variable "instance_profile_name" {
  type = string
  default = null
}
#-----------------#
data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}
variable "image_id" {
  type = string
  default = data.aws_ami.amazon-2.id
}
#-----------------#
variable "instance_initiated_shutdown_behavior" {
  type = string
  default = "terminate"
}
variable "instance_type" {
  type = string
  default = "t2.micro"
}
variable "key_name" {
  type = string
  default = null
}
variable "monitoring_enabled" {
  type = bool
  default = true
}
variable "associate_public_ip_address" {
  type = bool
  default = false
}
variable "security_group_ids" {
  type = list(string)
  default = null
}
variable "instance_name_tag" {
  type = string
  default = "instance"
}