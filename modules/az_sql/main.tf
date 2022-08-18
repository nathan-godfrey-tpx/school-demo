resource "azurerm_mysql_server" "sql_server" {
  name                = var.sql_server_name
  location            = var.location
  resource_group_name = var.rg_name

  version             = "12.0"
  minimum_tls_version = "1.2"

  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password

}

resource "azurerm_mssql_database" "db" {
  name           = var.sql_db_name
  server_id      = azurerm_mysql_server.sql_server.id
  collation      = "SQL_Latin1_General_CP1_CI_AS"
  max_size_gb    = var.sql_db_size_gb ? var.sql_db_size_gb : 4
  read_scale     = true
  sku_name       = "S0"
  zone_redundant = true

}