# Create Security Group for Application Load Balancer
resource "aws_security_group" "security_group_alb" {
    name        = "ALB Security Group"
    description = "Allow inbound traffic on port 80 and 443"
    vpc_id      = aws_vpc.VPC.id 

    ingress {
        description = "HTTP access"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        description = "HTTPS access"
        from_port   = 443
        to_port     = 443
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "ALB SG"
    }
}

# Create Security Group for Bastion Host aka Jump Box
resource "aws_security_group" "security_group_ssh" {
    name        = "SSH Security Group"
    description = "Allow outbound traffic on port 22"
    vpc_id      = aws_vpc.VPC.id 

    ingress {
        description = "SSH access"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = [var.SSH_location]
    }

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "SSH SG"
    }
}

# Create Security Group for Webservers
resource "aws_security_group" "security_group_webservers" {
    name        = "Webservers Security Group"
    description = "Allow inbound traffic on port 22, 80 and 443"
    vpc_id      = aws_vpc.VPC.id 

    ingress {
        description     = "SSH access"
        from_port       = 22
        to_port         = 22
        protocol        = "tcp"
        security_groups = [aws_security_group.security_group_ssh.id]
    }

    ingress {
        description     = "HTTP access"
        from_port       = 80
        to_port         = 80
        protocol        = "tcp"
        security_groups = [aws_security_group.security_group_alb.id]
    }

    ingress {
        description     = "HTTPS access"
        from_port       = 443
        to_port         = 443
        protocol        = "tcp"
        security_groups = [aws_security_group.security_group_alb.id]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "Webservers SG"
    }
}

# Create Security Group for Database
resource "aws_security_group" "security_group_database" {
    name        = "Database Security Group"
    description = "Allow inbound traffic on port 3306"
    vpc_id      = aws_vpc.VPC.id 

    ingress {
        description     = "MySQL/Aurora access"
        from_port       = 3306
        to_port         = 3306
        protocol        = "tcp"
        security_groups = [aws_security_group.security_group_webservers.id]
    }

    egress {
        from_port = 0
        to_port   = 0
        protocol  = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
      Name = "DB SG"
    }
}