### This ideally has the Secure keys so that we can establish the connection to AWS Please change accordinlgy

variable "aws_access_key" {
  default = "xxxxxxxxxxxxxxxxxxxxxx"
}

variable "aws_secret_key" {
  default = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
}

variable "aws_region" {
  default = "us-west-2"
}
variable "key_name" {
  default     = "xxxxxxxxxxxx"
}
variable "ami" {
  default     = "ami-082b5a644766e0e6f"
}
variable "availability_zone1" {
  default     = "us-west-2a"
}
variable "availability_zone2" {
  default     = "us-west-2b"
}
