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
variable "image_id" {
  type = string
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