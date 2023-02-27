variable "name" {
  description = "name for market maker prod"
  type        = string
  default     = "liqi-am-prod"

}


variable "subgroup" {
  description = "docdb subnet group name"
  type        = string
  default     = "subgroup"

}


variable "vpc_id" {
  description = "vpc id"
  type        = string
  default     = "vpc_id"

}


variable "subnet_id_docdb_1a" {
  description = "subnet docdb1a"
  type        = string
  default     = "subnet_id_docdb_1a"

}


variable "subnet_id_docdb_1b" {
  description = "subnet docdb1b"
  type        = string
  default     = "subnet_id_docdb_1b"

}

variable "list-docdb" {
  description = "db instance class"
  type        = list
  default     = ["db.t3.medium", "db.t3.large", "db.t3.xlarge", "db.m5.large", "db.m5.xlarge"]

}
