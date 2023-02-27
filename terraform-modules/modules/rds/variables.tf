variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = ""

}


variable "instance_type" {
  description = "Tipo da instância"
  type        = list(any)
  default     = ["db.t3.micro","db.t3a.small"]
}


variable "name" {
  description = "name"
  type        = string
  default     = "lab-kubernetes"

}


variable "subnet_id_rds_1a" {
  description = "subnet id1a"
  type        = string
  default     = ""

}

variable "subnet_id_rds_1b" {
  description = "subnet id1b"
  type        = string
  default     = ""

}