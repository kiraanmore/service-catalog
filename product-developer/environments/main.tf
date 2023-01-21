provider "aws" {
    region = "${var.aws_region}"
    default_tags {
        tags = {
            Environment = var.environment
            Owner       = var.product_owner
        }
    }
}

terraform {
  backend "s3" {
    bucket         = "hypha-terraform-state"
    key            = "dev/terraform.tfstate"
    region         = "us-east-2"
  }
}


module "service_catalog_portfolio_product" {
    source = "../modules/service-catalog"
    aws_region = var.aws_region
    bucket_name = var.bucket_name
    portfolio_description = var.portfolio_description
    portfolio_name = var.portfolio_name
    product_name = var.product_name
    product_owner = var.product_owner
    provider_name = var.provider_name
}
