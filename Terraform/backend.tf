terraform {
  backend "s3" {
    bucket         = "3bslam-infra-automation-tfstate"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

