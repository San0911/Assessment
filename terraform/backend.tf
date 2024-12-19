terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state"
    region         = "eu-central-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
