variable "region" {
  default = "eu-west-1"
}


variable "cluster_name" {
  default = "bank-of-anthos"
}


variable "vpc_cidr" {
  default = "10.0.0.0/16"
}


variable "instance_type" {
  default = "t3.small"
}


variable "desired_nodes" {
  default = 3
}


variable "min_nodes" {
  default = 3
}


variable "max_nodes" {
  default = 3
}