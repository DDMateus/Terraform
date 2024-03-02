# Create Elastic IP (EIP) for NAT Gateway in AZ 1
resource "aws_eip" "eip_for_nat_gateway_az1" {
    domain = "vpc"

    tags = {
        Name = "NAT Gateway AZ1 EIP"
    }
}

# Create Elastic IP (EIP) for NAT Gateway in AZ 2
resource "aws_eip" "eip_for_nat_gateway_az2" {
    domain = "vpc"

    tags = {
        Name = "NAT Gateway AZ2 EIP"
    }
}

# Create NAT Gateway in Public Subnet AZ1
resource "aws_nat_gateway" "nat_gateway_AZ1" {
    allocation_id = aws_eip.eip_for_nat_gateway_az1.id
    subnet_id     = aws_subnet.Public_Subnet_AZ1.id
    depends_on    = [aws_internet_gateway.IGW]

    tags = {
      Name = "NAT Gateway AZ 1"
    }
}

# Create NAT Gateway in Public Subnet AZ2
resource "aws_nat_gateway" "nat_gateway_AZ2" {
    allocation_id = aws_eip.eip_for_nat_gateway_az2.id
    subnet_id     = aws_subnet.Public_Subnet_AZ2.id
    depends_on    = [aws_internet_gateway.IGW]

    tags = {
      Name = "NAT Gateway AZ 2"
    }
}

# Create Private Route Table AZ1
resource "aws_route_table" "private_route_table_AZ1" {
    vpc_id = aws_vpc.VPC.id

    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_AZ1.id
    }

    tags = {
      Name = "Private Route Table AZ1"
    }
}

# Associate Private Route Table AZ1 - Private subnets AZ1
resource "aws_route_table_association" "private_app_subnet_AZ1_association" {
    subnet_id      = aws_subnet.Private_App_Subnet_AZ1.id
    route_table_id = aws_route_table.private_route_table_AZ1.id
}

resource "aws_route_table_association" "private_data_subnet_AZ1_association" {
    subnet_id      = aws_subnet.Private_Data_Subnet_AZ1.id
    route_table_id = aws_route_table.private_route_table_AZ1.id
}

# Create Private Route Table AZ2
resource "aws_route_table" "private_route_table_AZ2" {
    vpc_id = aws_vpc.VPC.id

    route {
        cidr_block     = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gateway_AZ2.id
    }

    tags = {
      Name = "Private Route Table AZ2"
    }
}

# Associate Private Route Table AZ2 - Private subnets AZ2
resource "aws_route_table_association" "private_app_subnet_AZ2_association" {
    subnet_id      = aws_subnet.Private_App_Subnet_AZ2.id
    route_table_id = aws_route_table.private_route_table_AZ2.id
}

resource "aws_route_table_association" "private_data_subnet_AZ2_association" {
    subnet_id      = aws_subnet.Private_Data_Subnet_AZ2.id
    route_table_id = aws_route_table.private_route_table_AZ2.id
}
