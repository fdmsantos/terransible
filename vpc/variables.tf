variable "vpc_cidr" {}
variable "cidrs" {
  type = "map"
}
data "aws_availability_zones" "available" {}
variable "localip" {}
variable "domain_name" {}
variable "aws_region" {}