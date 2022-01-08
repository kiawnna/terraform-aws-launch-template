resource "aws_launch_template" "launch_template" {
  name = "shared-${var.environment}-lt"
  ebs_optimized = var.ebs_optimized
  image_id = var.image_id
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type = var.instance_type
  key_name = var.key_pair
  vpc_security_group_ids = var.security_group_ids
  user_data = var.user_data

  dynamic iam_instance_profile {
    for_each = var.instance_profile_name != null ? [1] : []
    content {
     name = var.instance_profile_name
    }
  }

  monitoring {
    enabled = var.monitoring_enabled
  }

  dynamic network_interfaces {
    for_each = var.associate_public_ip_address != null ? [1] : []
    content {
     name = var.associate_public_ip_address
    }
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.instance_name_tag}-${var.environment}"
      Deployment_Method = "terraform"
      Environment = var.environment
    }
  }
}