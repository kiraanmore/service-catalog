Provisioning AWS VPC with Service Catalog

Prerequisites :
1. Need Terraform and aws cli configured to use this Terraform code.
2. You need a bucket created to store the terraform state.

Steps to follow as product developer:

1. Clone the git repository.
2. Update bucket, key and region in environments/main.tf for terraform backend.
3. Run steps as below to run the stack:

   cd environments
	
   terraform init
	
   terraform plan --var-file=dev.tfvars
	
   terraform apply --var-file=dev.tfvars


Steps to follow as product consumer:

1. Clone the git repository.
2. Update bucket, key and region in product-consumer/backend.tf for terraform backend.
3. Update the values for product_id, provisioning_artifact_id and other values as needed in dev.tfvars
4. Run steps as below to run the stack:

   cd environments
	
   terraform init
	
   terraform plan --var-file=dev.tfvars
	
   terraform apply --var-file=dev.tfvars
