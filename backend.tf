# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket    = "sa-auto-prod-terraform"
    key       = "prod_eks_01/terraform.tfstate"
    region    = "us-east-1"
    profile   = "terraform-user"
  }
}