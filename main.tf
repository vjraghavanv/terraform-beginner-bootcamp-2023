terraform {
  required_providers {
    random = {
      source = "hashicorp/random"
      version = "3.5.1"
    }
    aws = {
      source = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

provider "aws"{
}

#https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string
provider "random" {
  # Configuration options
}

#https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket
resource "random_string" "bucket_name" {
  lower=true
  upper=false
  length = 32
  special = false
  #bucket naming rules
#https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html
}

output "random_bucket_name" {
  value = random_string.bucket_name.result
}
