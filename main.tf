terraform {
  # backend "remote" {
  #   hostname = "app.terraform.io"
  #   organization = "terraform-beginners-bootcamp"

  #   workspaces {
  #     name = "terra-house-1"
  #   }
  # }
  cloud {
    organization = "terraform-beginners-bootcamp"

    workspaces {
      name = "terra-house-1"
    }
  }
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.18.1"
    }
  }
}

provider "random" {
  # Configuration options
}

resource "random_string" "bucket_name" {
  lower   = true
  upper   = false
  length  = 32
  special = false
}

resource "aws_s3_bucket" "example" {
  # Bucket naming rules
  # https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
  bucket = random_string.bucket_name.result
} 

output "random_bucket_name" {
    value = random_string.bucket_name.result
}

