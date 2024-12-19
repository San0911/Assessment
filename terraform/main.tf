provider "aws" {
  region  = var.aws_region
  profile = "User-1"
}


# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

# PostgreSQL database
resource "aws_db_instance" "postgres" {
  allocated_storage    = 20
  engine               = "postgres"
  engine_version       = "15.2"
  instance_class       = "db.t3.micro"
  db_name                 = var.db_name
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
