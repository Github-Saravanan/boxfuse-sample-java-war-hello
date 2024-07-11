terraform {
  backend "s3" {
    bucket         = "elasticbeanstalk-us-east-1-339712811840"  # Replace with your S3 bucket name
    key            = "statefile/dev/terraform.tfstate"
    region         = "us-east-1"                  # Replace with your AWS region
  }
}
