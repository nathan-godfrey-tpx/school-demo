resource "azurerm_service_plan" "sp" {
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.rg_name
  sku_name            = "B1"
  os_type             = "Windows"
}

resource "azurerm_windows_web_app" "webapp" {
  name                = "${var.web_app_name}-web-app"
  location            = var.location
  resource_group_name = var.rg_name
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