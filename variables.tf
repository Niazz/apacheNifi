variable "ami" {
  description = "Amazon Linux 2023 AMI"
  default     = "ami-0669b163befffbdfc"
}

variable "instance_type" {
  description = "Instance type"
  default     = "t2.micro"
}