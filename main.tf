resource "azurerm_resource_group" "rg" {
  name     = "qa-interviews"
  location = "uksouth"
}

module "az_app" {
  source            = "./modules/az_app"
  rg_name           = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  service_plan_name = "school-demo"
  web_app_name      = "school-demo"
}
