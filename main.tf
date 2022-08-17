provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "qa-interviews"
  location = "uksouth"
}

resource "azurerm_service_plan" "sp" {
  name                = "school-demo"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku_name            = "B1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "${azurerm_service_plan.sp.name}-web-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  service_plan_id     = azurerm_service_plan.sp.id
  https_only          = true

  site_config {
    ftps_state            = "FtpsOnly"
    managed_pipeline_mode = "Integrated"
    always_on             = false

    application_stack {
      current_stack  = "dotnet"
      dotnet_version = "v6.0"
    }
  }
}