resource "azurerm_resource_group" "amar_rg" {
  name     = "${var.base_name}RG"
  location = var.location
}