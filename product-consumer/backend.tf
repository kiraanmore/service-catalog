terraform {
  backend "s3" {
    bucket         = "hypha-terraform-state"
    key            = "dev/product/terraform.tfstate"
    region         = "us-east-2"
  }
}