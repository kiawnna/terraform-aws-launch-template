# terraform-aws-launch-template
An opinionated module that creates a launch template for use with an autoscaling group.

## Instantiation
The simplest instantiation requires only an environment.

```
module "launch_template" {
  source = "git@github.com:kiawnna/terraform-aws-launch-template.git"
  environment = "dev"
}
```
> This example will create a launch template that accepts all the provided defaults. Review defaults below under Variables / Customizations.

## Resources Created
* A launch template.

## Outputs
The launch template id and arn are outputs.

Reference them as:

> module.launch_template_module_name.launch_template_id
> 
> module.launch_template_module_name.launch_template_arn

## Variables / Customization
The variable below can be customized to fit your needs. The current defaults are:
>  * `ebs_optimized` &rarr; *true*
>  * `instance_profile_name` &rarr; none
>  * `image_id` &rarr; Amazon Linux 2 ami for current region
>  * `instance_initiated_shutdown_behavior` &rarr; terminate
>  * `instance_type` &rarr; t2.micro
>  * `key_name` &rarr; none
>  * `monitoring_enabled` &rarr; *true*
>  * `associate_public_ip_address` &rarr; *false*
>  * `security_group_ids` &rarr; none
>  * `instance_name_tag` &rarr; instance

See the `variables.tf` file for further information.

## Tags
Tags are automatically added to all resources where possible. Tags will have the following format:

```
tags = {
    Name = "${var.instance_name_tag}-${var.environment}-resource"
    Deployment_Method = "terraform"
    Environment = var.environment
  }
```

