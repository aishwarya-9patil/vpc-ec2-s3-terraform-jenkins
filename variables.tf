# variables.tf

# Define any variables that you need for your configuration
variable "aws_region" {
  description = "The AWS region to deploy the resources"
  type        = string
  default     = "ap-south-1"
}

