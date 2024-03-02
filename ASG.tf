# Create Launch Template
resource "aws_launch_template" "launch_template" {
  name          = var.launch_template_name
  image_id      = var.EC2_image_ami
  instance_type = var.EC2_instance_type
  key_name      = var.EC2_keypair_name
  description   = "Launch template for ASG"

  monitoring {
    enabled = true
  }
  
# Define other parameters such as security groups, IAM instance profile, etc. as needed
  vpc_security_group_ids = [aws_security_group.security_group_webservers.id]
}

# Create Auto Scaling Group
resource "aws_autoscaling_group" "auto_scaling_group" {
  launch_template {
    name    = aws_launch_template.launch_template.name
    version = "$Latest"  
  }

  # Define other parameters for the auto-scaling group such as min_size, max_size, desired_capacity, etc.
  name                 = "dev-asg"
  min_size             = 1
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [aws_subnet.Private_App_Subnet_AZ1.id, aws_subnet.Private_App_Subnet_AZ2.id]
  health_check_type    = "ELB"

  tag {
    key                 = "Name"
    value               = "ASG Web server"
    propagate_at_launch = true
  } 
}

# Attach Auto Scaling Group to ALB Target Group
resource "aws_autoscaling_attachment" "asg_alb_target_group_attachment" {
    autoscaling_group_name = aws_autoscaling_group.auto_scaling_group.id
    lb_target_group_arn    = aws_lb_target_group.alb_target_group.arn
}

# Create Auto Scaling Group Notification
resource "aws_autoscaling_notification" "webserver_asg_notification" {
    group_names = [aws_autoscaling_group.auto_scaling_group.name]

    notifications = [
       "autoscaling:EC2_INSTANCE_LAUNCH",
       "autoscaling:EC2_INSTANCE_TERMINATE",
       "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
       "autoscaling:EC2_INSTANCE_TERMINATE_ERROR", 
    ]

    topic_arn = aws_sns_topic.user_updates.arn
}