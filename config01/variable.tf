# Azure Variable Definitions
variable "business_divsion" {
  type = string
  default = "finance"
}
# Azure Environment Name
variable "environment" {
  type = string
  default = "dev"
}


# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default = "inggss"

}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default = "central india"

}
# Azure vnet_name
variable "vnet_name" {
  description = "Region in which Azure Resources to be created"
  type        = string

}
# net_address_space
variable "vnet_address_space" {
  description = "Region in which Azure Resources to be created"
  type        = list(string)

}

# web_subnet_name
variable "web_subnet_name" {
  description = "Region in which Azure Resources to be created"
  type        = string

}

# web_subnet_address
variable "web_subnet_address" {
  description = "Region in which Azure Resources to be created"
  type        = list(string)

}