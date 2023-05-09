
remote_state {
  backend = "s3"
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
  config = {
    bucket = "name-of-bucket"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-table"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
  terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~> 4.0"
      }
    }
  }
  provider "aws" {
    region = "us-east-1"
    profile = "default"
}
EOF
}

##