terraform {
  backend "s3" {
    bucket         = "hypha-terraform-state"
    key            = "terraform.tfstate"
    region         = "us-east-2"
  }
}