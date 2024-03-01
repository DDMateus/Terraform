# Create VPC
resource "aws_vpc" "VPC" {
    cidr_block           = var.VPC_cidr
    instance_tenancy     = "default"
    enable_dns_hostnames = true

    tags = {
      Name = "Dev VPC"
    }
}

# Create Internet Gateway and attach it to VPC
resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.VPC.id

    tags = {
      Name = "Dev IGW"
    }
}

# Create Public Subnet AZ 1
resource "aws_subnet" "Public_Subnet_AZ1" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Public_Subnet_AZ1_cidr
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      Name = "Public Subnet AZ 1"
    }
}

# Create Public Subnet AZ 2
resource "aws_subnet" "Public_Subnet_AZ2" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Public_Subnet_AZ2_cidr
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = true

    tags = {
      Name = "Public Subnet AZ 2"
    }
}

# Create Public Route Table and add Public Route
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.VPC.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }

    tags = {
      Name = "Public Route Table"
    }
}

# Create Public Route Table - Public Subnet AZ1 Association
resource "aws_route_table_association" "public_subnet_AZ1_association" {
    subnet_id      = aws_subnet.Public_Subnet_AZ1.id
    route_table_id = aws_route_table.public_route_table.id
}

# Create Public Route Table - Public Subnet AZ2 Association
resource "aws_route_table_association" "public_subnet_AZ2_association" {
    subnet_id      = aws_subnet.Public_Subnet_AZ2.id
    route_table_id = aws_route_table.public_route_table.id
}

# Create Private App Subnet AZ 1
resource "aws_subnet" "Private_App_Subnet_AZ1" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Private_App_Subnet_AZ1_cidr
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
      Name = "Private App Subnet AZ 1"
    }
}

# Create Private App Subnet AZ 2
resource "aws_subnet" "Private_App_Subnet_AZ2" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Private_App_Subnet_AZ2_cidr
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
      Name = "Private App Subnet AZ 2"
    }
}

# Create Private Data Subnet AZ 1
resource "aws_subnet" "Private_Data_Subnet_AZ1" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Private_Data_Subnet_AZ1_cidr
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = false

    tags = {
      Name = "Private Data Subnet AZ 1"
    }
}

# Create Private Data Subnet AZ 2
resource "aws_subnet" "Private_Data_Subnet_AZ2" {
    vpc_id                  = aws_vpc.VPC.id
    cidr_block              = var.Private_Data_Subnet_AZ2_cidr
    availability_zone       = "us-east-1b"
    map_public_ip_on_launch = false

    tags = {
      Name = "Private Data Subnet AZ 2"
    }
}
