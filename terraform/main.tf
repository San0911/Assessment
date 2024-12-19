provider "aws" {
  region  = var.aws_region
  profile = "User-1"
}

# PostgreSQL database
resource "aws_db_instance" "postgres" {
  allocated_storage    = 5
  engine               = "postgres"
  engine_version       = "15.2"
  instance_class       = "db.t3.micro"
  db_name              = var.db_name
  username             = var.db_user
  password             = var.db_password
  skip_final_snapshot  = true
}

output "db_connection_details" {
  value = jsonencode({
    db_host     = aws_db_instance.postgres.endpoint
    db_user     = aws_db_instance.postgres.username
    db_password = aws_db_instance.postgres.password
    db_name     = aws_db_instance.postgres.name
  })
  sensitive = true
}
