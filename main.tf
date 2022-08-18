resource "azurerm_resource_group" "rg" {
  name     = "rg-ngtest-webapp"
  location = "uksouth"
}

module "az_app" {
  source            = "./modules/az_app"
  rg_name           = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  service_plan_name = "ng-webapp-testing"
  web_app_name      = "ng-webapp-testing"
}

module "az_sql" {
  source             = "./modules/az_sql"
  rg_name            = azurerm_resource_group.rg.name
  location           = azurerm_resource_group.rg.location
  sql_server_name    = "ng-webapp-testing-db-server"
  sql_admin_login    = "sqladmin_totally_secure"
  sql_admin_password = "D0_n0T_uSe_1N_L1vE_enV?!"
  sql_db_name        = "ng-webapp-testing-db"
}

output "web_app_hostname" {
  value = module.az_app.web_app_hostname
}
