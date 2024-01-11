provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::631495572015:role/nifi_role"
  }

}

resource "aws_vpc" "nifi_vpc" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "nifi_vpc"
  }
}

resource "aws_subnet" "nifi_subnet" {
  vpc_id                  = aws_vpc.nifi_vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-central-1" 

  tags = {
    Name = "nifi_subnet"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow incoming SSH traffic from my IP"
  vpc_id      = aws_vpc.nifi_vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["77.99.211.113/32"] 
  }
}

resource "aws_instance" "nifi_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id     = aws_subnet.nifi_subnet.id
  key_name      = "sshKeyApp"
  
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]


  tags = {
    Name = "nifi-instance"
  }
}

