provider "aws" {
  region = "eu-central-1"

  assume_role {
    role_arn = "arn:aws:iam::631495572015:role/nifi_role"
  }

}

resource "aws_instance" "nifi_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = "sshKeyApp"

  tags = {
    Name = "nifi-instance"
  }
}

