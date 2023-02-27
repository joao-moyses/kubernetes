terraform {
  required_version = ">= 0.14"
  backend "s3" {
    bucket = "terraform-root-joaomoyses"
    key    = "kubernetes/terraform.tfstate"
    region = "us-east-1"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.56.0"
    }
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "default"
}