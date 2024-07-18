terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-1"
}

resource "aws_instance" "server" {
  count = var.instance_count

  ami           = "ami-080d1454ad4fabd12"
  instance_type = "t2.micro"
  key_name = "terraform"
  
  tags = {
    Name = "server ${count.index + 1}"
  }
}

resource "local_file" "test" {
  content  = templatefile("${path.module}/inventory.tpl", { ips = aws_instance.server.*.public_ip })
  
  filename = "${path.module}/../ansible/inventory.ini"
}