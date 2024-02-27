
variable "vpc_id" {
  type = string
}

variable "security_group_ids" {
  type = list(string)
}

variable "target_id" {
  type = list(string)
}
