variable "vpc_cidr" {}
variable "cidrs" {
  type = "map"
}
variable "availability_zones_names" {
  type = "list"
}
variable "localip" {}
variable "domain_name" {}
variable "aws_region" {}