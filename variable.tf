variable "region" {
  description = "vpc region"
  type        = string
  default     = "eu-west-2"
}

variable "vpc_cidr" {
  description = "vpc cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "pub_subnet_1_cidr" {
  description = "vpc pub subnet-1 cidr"
  type        = string
  default     = "10.0.1.0/24"
}

variable "pub_subnet_2_cidr" {
  description = "vpc pub subnet-2 cidr"
  type        = string
  default     = "10.0.2.0/24"
}

variable "priv_subnet_1_cidr" {
  description = "vpc priv subnet-1 cidr"
  type        = string
  default     = "10.0.3.0/24"
}

variable "priv_subnet_2_cidr" {
  description = "vpc priv subnet-2 cidr"
  type        = string
  default     = "10.0.4.0/24"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "ami" {
  description = "ec2 Amazon Machine Image"
  type        = string
  default     = "ami-0b53285ea6c7a08a7"
}

variable "amazon_machine_image" {
  description = "launch template Amazon Machine Image to use"
  type        = string
  default     = "ami-05d929ac8893c382f"
}

variable "instance_type_lt" {
  description = "launch template instance type to use"
  type        = string
  default     = "t2.micro"
}

