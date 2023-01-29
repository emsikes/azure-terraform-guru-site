# Terraform settings block

required_version = ">= 1.0.0"

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.0"
    }
  }
}

backend "azurerm" {
  resource_group_name   = ""
  storage_account_name  = ""
  container_name        = ""
  key                   = ""

}

# Confgiure Azure provider
provider "azurerm" {
    features {}
}

# Create resource group
resource "azurerm_resource_group" "demo-rg1" {  # resource block and resource label
  location = "eastus" # argument name or identifider and value or expression
  name = "demo-rg1" # argument
}

// optional comment format

/*
Multi-line comment
*/
