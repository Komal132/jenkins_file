variable "prefix" {
  description = "this will add to every resource"
  default     = "nexus"
}
variable "tomcat" {
  description = "this will add to every resource"
  default     = "tomcat"
}

/*variable "sonar" {
  description = "this will add to every resource"
  default     = "sonarqube"
}*/

variable "tomcat2" {
  description = "this will add to every resource"
  default     = "tomcat2"
}

variable "region" {
  description = "AWS region to deploy resources"
  default     = "ap-south-1"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "CIDR block for the subnet"
  default     = "10.0.1.0/24"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "instance_type1" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "instance_type2" {
  description = "EC2 instance type"
  default     = "t2.medium"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  #default     = "ami-05e00961530ae1b55"  # Amazon Linux 2 AMI (example for us-east-1)
  default      = "ami-01376101673c89611"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  default     = "terraform-key"
}
