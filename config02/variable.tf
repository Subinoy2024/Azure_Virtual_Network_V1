variable "business_divsion" {
  type = string
  default = "finance"
}
variable "environment" {
  type = string
  default = "dev"
}
variable "resource_group" {
  type = map(object({
    name= string
    locations= string
  }) )
}


variable "virtual_network"{
  type=map(object({
    name=string
    address_space=list(string)
    location=string
    resource_group_name=string
    tags=optional(map(string))
  }))
}

variable "subnets"{
  type=list(object({
    name=string
    address_prefix=string
  })
  )
}