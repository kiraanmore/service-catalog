provider "aws" {
    region = "${var.aws_region}"
}

resource "aws_servicecatalog_provisioned_product" "product_deployment" {
  name                     = var.product_name
  product_id               = var.product_id
  provisioning_artifact_id = var.provisioning_artifact_id

  provisioning_parameters {
    key   = "ProductName"
    value = var.product_name
  }

  provisioning_parameters {
    key   = "ProductId"
    value = var.product_id
  }

  provisioning_parameters {
    key   = "ProductVersion"
    value = var.product_version
  }

  provisioning_parameters {
    key   = "CidrBlock"
    value = var.vpc_cidrblock
  }

  provisioning_parameters {
    key   = "PublicSubnet1Cidr"
    value = var.public_subnet1_cidr
  }

  provisioning_parameters {
    key   = "PublicSubnet2Cidr"
    value = var.public_subnet2_cidr
  }

  provisioning_parameters {
    key   = "PrivateSubnet1Cidr"
    value = var.private_subnet1_cidr
  }

  provisioning_parameters {
    key   = "PrivateSubnet2Cidr"
    value = var.private_subnet2_cidr
  }

  tags = {
    foo = "bar"
  }
}