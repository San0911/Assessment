terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"
    key            = "terraform/state"
    region         = "${{ secrets.AWS_REGION }}"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
