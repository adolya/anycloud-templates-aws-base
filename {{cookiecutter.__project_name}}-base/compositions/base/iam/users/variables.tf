variable "admin_user_name" {
  type = string
}

variable "groups" {
  type = map(any)
}

variable "tfstate_group_name" {
  type = string
}