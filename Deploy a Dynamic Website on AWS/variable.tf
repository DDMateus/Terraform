# VPC variables
variable "VPC_cidr" {
    default     = "10.0.0.0/16"
    description = "VPC CIDR block" 
    type        = string
}

variable "Public_Subnet_AZ1_cidr" {
    default     = "10.0.0.0/24"
    description = "Public Subnet AZ1 CIDR block" 
    type        = string
}

variable "Public_Subnet_AZ2_cidr" {
    default     = "10.0.1.0/24"
    description = "Public Subnet AZ2 CIDR block" 
    type        = string
}

variable "Private_App_Subnet_AZ1_cidr" {
    default     = "10.0.2.0/24"
    description = "Private App Subnet AZ1 CIDR block" 
    type        = string
}

variable "Private_App_Subnet_AZ2_cidr" {
    default     = "10.0.3.0/24"
    description = "Private App Subnet AZ2 CIDR block" 
    type        = string
}

variable "Private_Data_Subnet_AZ1_cidr" {
    default     = "10.0.4.0/24"
    description = "Private Data Subnet AZ1 CIDR block" 
    type        = string
}

variable "Private_Data_Subnet_AZ2_cidr" {
    default     = "10.0.5.0/24"
    description = "Private Data Subnet AZ2 CIDR block" 
    type        = string
}

# Security Group Variable
variable "SSH_location" {
    default     = "0.0.0.0/0"
    description = "The IP address that can ssh into the EC2 instance" 
    type        = string
}

# RDS Variables
variable "DB_Snapshot_Identifier" {
    default     = "arn:aws:rds:us-east-1:381492302972:snapshot:snapshot-example"
    description = "Database snapshot arn" 
    type        = string
}

variable "DB_Instance_Class" {
    default     = "db.t2.micro"
    description = "Database instance type" 
    type        = string
}

variable "DB_Identifier" {
    default     = "dev-rds-db"
    description = "Database instance identifier" 
    type        = string
}

variable "Multi-AZ-Deployment" {
    default     = false
    description = "Multi AZ Deployment" 
    type        = bool
}

# ALB Variables
variable "ssl_certificate_arn" {
    default     = "arn:aws:acm:us-east-1:381492302972:certificate/4f6ae1bd-37b2-49d8-b084-4ed010b1e70f"
    description = "SSL certificate arn" 
    type        = string
}

# SNS Topic Variables
variable "sns_subscription_email" {
    default     = "diogo.22.09@gmail.com"
    description = "Valid email address" 
    type        = string
}

# ASG Variables
variable "launch_template_name" {
    default     = "dev-launch-template"
    description = "Launch template name" 
    type        = string
}

variable "EC2_image_ami" {
    default     = "ami-0440d3b780d96b29d"
    description = "ID of the AMI" 
    type        = string
}

variable "EC2_instance_type" {
    default     = "t2.micro"
    description = "EC2 instance type" 
    type        = string
}

variable "EC2_keypair_name" {
    default     = "EC2KeyPair"
    description = "EC2 Key Pair name" 
    type        = string
}

# Route53 Variables
variable "Domain_name" {
    default     = "super-cool-domain.com"
    description = "Domain name" 
    type        = string
}

variable "Record_name" {
    default     = "www"
    description = "Subdomain name" 
    type        = string
}
