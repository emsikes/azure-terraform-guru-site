# Terraform settings block
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.38.0"
    }
  }
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
