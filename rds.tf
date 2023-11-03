#AWS RDS
resource "aws_db_instance" "poc_rds" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.7"
    instance_class = "db.t3.micro"
    identifier = "mydb"
    username = "testuser"
    password = "dbpassword"

    vpc_security_group_ids = [aws_security_group.poc_sg.id]
    db_subnet_group_name = aws_db_subnet_group.poc_db_subnet_group.name
    backup_retention_period = 7
    skip_final_snapshot = false
    final_snapshot_identifier = "database"
}