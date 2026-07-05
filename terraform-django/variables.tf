variable "instance_type" {
  description = "This is an EC2 instance type"
  type        = string
  default     = "t3.micro"
}
variable "ami_id" {
  description = "This is ami-id"
  type        = string
  default = "ami-0b6d9d3d33ba97d99"
  
}

variable "key_name" {
  description = "This is a key"
  type        = string
  default = "terraform-access-key"
  
}