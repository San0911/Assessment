terraform {
  backend "s3" {
    bucket         = "san-tfstate-bucket"
    key            = "terraform/state"
    profile        = "User-1"
    region         = "us-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
