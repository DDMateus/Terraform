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