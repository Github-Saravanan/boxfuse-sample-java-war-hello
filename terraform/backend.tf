terraform {
  backend "s3" {
    bucket         = "awsbucket-us-west-2-07"  # Replace with your S3 bucket name
    key            = "dev-statefile/terraform.tfstate"
    region         = "us-west-2"                  # Replace with your AWS region
  }
}
