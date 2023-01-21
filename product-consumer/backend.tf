terraform {
  backend "s3" {
    bucket         = "hypha-terraform-state"
    key            = "${var.environment}/product/terraform.tfstate"
    region         = "us-east-2"
  }
}