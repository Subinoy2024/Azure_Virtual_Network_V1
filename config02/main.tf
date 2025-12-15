# Random String Resource
resource "random_integer" "myrandom" {
 min = 10
 max = 99
}

#azure Resource Group
resource "azurerm_resource_group" "rg" {
  for_each = var.resource_group
  name     = "${local.resource_name_prefix}-${each.value.name}-${random_integer.myrandom.result}"
  location = each.value.locations
  tags     = local.common_tags
}
resource "azurerm_virtual_network" "vnet"{
  for_each=var.virtual_network
  name =each.value.name
  address_space=each.value.address_space
  location=each.value.location
  resource_group_name=each.value.resource_group_name
  tags=each.value.tags

dynamic "subnet" {
  for_each=var.subnets
  content {
    name= subnet.value.name
    address_prefixes = [subnet.value.address_prefix]
  }
}
}
