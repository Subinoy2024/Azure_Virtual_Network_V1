# Generate a random string to append to resource group name for uniqueness
resource "random_integer" "myrandom" {
 min = 10
 max = 99
}
#azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_integer.myrandom.result}"
  location = var.resource_group_location
  tags     = local.common_tags
}

# Create Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "${local.resource_name_prefix}-${var.vnet_name}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags                = local.common_tags
}

# Azure Subnet Resource
resource "azurerm_subnet" "websubnet" {
  name                 = "${azurerm_virtual_network.vnet.name}-${var.web_subnet_name}"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_address
}







# resource "azurerm_subnet" "subnet0" {
#     for_each = var.subnets
#   name                 = "${var.environment}-${var.business_divsion}${each.value.name.name}"
#   resource_group_name  = each.value.resource_group_name
#   virtual_network_name = each.value.virtual_network_name
#   address_prefixes     = each.value.address_prefixes
# }