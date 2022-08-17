terraform {
  required_providers {
    azurerm = ">= 3.17.0"
  }
  required_version = ">= 1.2.4"
}

provider "azurerm" {
  features {}
}
