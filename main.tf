provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "test" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.small"

  tags = {
    Name = "Production-Test-Server"
  }
}


resource "aws_s3_bucket" "demo-bucket" {
    bucket = "bucket-e334533453sdf---7727727727"
  
}


terraform {
  required_version = ">= 1.0.0"
  
  backend "s3" {
    bucket         = "my-company-terraform-state-bucket-sai"
    key            = "jenkins-pipeline/terraform.tfstate" # The path inside the bucket
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform-state-locks" # Tells Terraform to lock using this table
  }


   
}