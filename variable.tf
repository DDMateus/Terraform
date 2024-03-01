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