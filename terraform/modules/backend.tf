terraform {
  backend "s3" {
    bucket = "ny-terraform-states"
    key = "umami/terraform.tfstate"
    region = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt = true
  }
}