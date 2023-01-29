
# pessimistic operator - tilde, will check rightmost minor version otherwise >= will only check major version
# source is the location to download the provider from
# source expressed in 3 parts with a slash delimiter (registry name optional and assumed by default)

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.39.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

resource "azurerm_resource_group" "myrg" {
    name = "myrg-1"
    location = "East US"
  
}