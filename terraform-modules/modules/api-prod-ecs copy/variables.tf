variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = "vpc_id"

}


variable "name" {
  description = "name for market maker prod"
  type        = string
  default     = "api-prod"

}


variable "subnet_id1a" {
  description = "subnet id1a"
  type        = string
  default     = "subnet_id1a"

}


variable "subnet_id1b" {
  description = "subnet id1b"
  type        = string
  default     = "subnet_id1b"

}


variable "subnet_id_pub1a" {
  description = "subnet id1b"
  type        = string
  default     = "subnet_id_pub1a"

}


variable "subnet_id_pub1b" {
  description = "subnet id1b"
  type        = string
  default     = "liqi-market-maker-prod"

}

