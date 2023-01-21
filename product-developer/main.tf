resource "random_string" "random" {
  length           = 16
  special          = false
  lower            = true
  upper            = false
}

resource "aws_s3_bucket" "product_template_bucket" {
  bucket = "${var.bucket_name}-${random_string.random.id}"
}

resource "aws_s3_object" "product_template" {
  bucket = aws_s3_bucket.product_template_bucket.id
  key    = "template.yaml"
  source = "./template.yaml"
}

resource "aws_servicecatalog_portfolio" "portfolio" {
  name          = var.portfolio_name
  description   = var.portfolio_description
  provider_name = var.provider_name
}

resource "aws_servicecatalog_product" "product" {
  name  = var.product_name
  owner = var.product_owner
  type  = "CLOUD_FORMATION_TEMPLATE"

  provisioning_artifact_parameters {
    template_url = "https://s3.amazonaws.com/${aws_s3_bucket.product_template_bucket.id}/${aws_s3_object.product_template.id}"
    type  = "CLOUD_FORMATION_TEMPLATE"
  }
}

resource "aws_servicecatalog_product_portfolio_association" "product_portfolio_association" {
  portfolio_id = aws_servicecatalog_portfolio.portfolio.id
  product_id   = aws_servicecatalog_product.product.id
}