# Create Application Load Balancer
resource "aws_lb" "application_load_balancer" {
  name               = "dev-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.security_group_alb.id]

  subnet_mapping {
    subnet_id        = aws_subnet.Public_Subnet_AZ1.id
  }

  subnet_mapping {
    subnet_id        = aws_subnet.Public_Subnet_AZ2.id
  }

  enable_deletion_protection = false

  tags = {
    Name = "ALB"
  }
}

# Create Target Group
resource "aws_lb_target_group" "alb_target_group" {
  name        = "dev-tg"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.VPC.id

  health_check {
    interval            = 30
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200-399"
  }
}

# Create ALB Listener on port 80
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "redirect"

    redirect {
      port          = "443"
      protocol      = "HTTPS"
      status_code   = "HTTP_301"
      host          = "#{host}"
      path          = "/#{path}"
    }
  }
}

# Create ALB Listener on port 443
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.ssl_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}