# Create Database Subnet Group
resource "aws_db_subnet_group" "database_subnet_group" {
    name        = "database subnet group"
    subnet_ids  = [aws_subnet.Private_Data_Subnet_AZ1.id, aws_subnet.Private_Data_Subnet_AZ2.id]
    description = "Subnets for Database instance"

    tags = {
      Name = "DB Subnet Group"
    }
}

# Retrieve Latest DB Snapshot
data "aws_db_snapshot" "latest_db_snapshot" {
    most_recent            = true
    db_snapshot_identifier = var.DB_Snapshot_Identifier
    snapshot_type          = "manual"
}

# Create Database instance restored from Database Snapshot
resource "aws_db_instance" "database_instance" {
  instance_class         = var.DB_Instance_Class
  skip_final_snapshot    = true
  availability_zone      = "us-east-1b"
  identifier             = var.DB_Identifier
  snapshot_identifier    = data.aws_db_snapshot.latest_db_snapshot.id
  db_subnet_group_name   = aws_db_subnet_group.database_subnet_group.name
  multi_az               = var.Multi-AZ-Deployment
  vpc_security_group_ids = [aws_security_group.security_group_database.id]
}
