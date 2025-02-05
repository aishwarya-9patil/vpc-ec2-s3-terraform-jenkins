# main.tf

# Provider Configuration
provider "aws" {
  region = "ap-south-1"  # Use the region you want or configure a variable
}

# Generate a random string to create a unique name for the S3 bucket
resource "random_id" "bucket_suffix" {
  byte_length = 8
}

# Create an S3 bucket with a unique name
resource "aws_s3_bucket" "example_bucket" {
  bucket = "aishu-bucket-${random_id.bucket_suffix.hex}"  # Ensure uniqueness
  acl    = "private"

  tags = {
    Environment = "Dev"
    Name        = "Example S3 Bucket"
  }
}

# Create an EC2 instance
resource "aws_instance" "example_ec2" {
  ami           = "ami-05fa46471b02db0ce"  # Replace with a valid AMI ID in your region
  instance_type = "t2.micro"               # Adjust based on your needs

  tags = {
    Name = "s3-server"
  }

  # Add key_name if you want to SSH into the EC2 instance
  # key_name = "aish-key" 
}

# Enable versioning on the S3 bucket
resource "aws_s3_bucket_versioning" "example_versioning" {
  bucket = aws_s3_bucket.example_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
