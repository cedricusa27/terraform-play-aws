# VPC Variables
variable "aws_region" {
  default       = "us-west-2"
  description   = "AWS Region"
  type          = string
}

variable "vpc-cidr" {
  default       = "10.11.0.0/16"
  description   = "VPC CIDR Block"
  type          = string
}

variable "public-subnet-1-cidr" {
  default       = "10.11.2.0/24"
  description   = "Public Subnet 1 CIDR Block"
  type          = string
}

variable "private-subnet-1-cidr" {
  default       = "10.11.1.0/24"
  description   = "Private Subnet 1 CIDR Block"
  type          = string
}

variable "Instance_key_pair" {
  default       = "test1"
  description = "creating variable to hold key pair name"
  type = string
}

variable "Instance_type" {
  default = "t3.micro"
  description = "creating variable to hold instance type"
  type = string
  
}