variable "aws_region" {
  default = "us-west-2"
}

variable "s3_bucket_name" {
  description = "S3 bucket name for Terraform state storage"
}

variable "db_name" {
  description = "PostgreSQL database name"
  default = ${{secrets.DB_NAME}}
}

variable "db_user" {
  description = "PostgreSQL database username"
  default = ${{secrets.DB_USER}}
}

variable "db_password" {
  description = "PostgreSQL database password"
  sensitive   = true
  default = ${{secrets.DB_PASSWORD}}
}
