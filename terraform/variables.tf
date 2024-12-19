variable "aws_region" {
  default = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Terraform state storage"
}

variable "db_name" {
  description = "PostgreSQL database name"
}

variable "db_user" {
  description = "PostgreSQL database username"
}

variable "db_password" {
  description = "PostgreSQL database password"
  sensitive   = true
}