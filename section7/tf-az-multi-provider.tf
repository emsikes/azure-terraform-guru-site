
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

# Provider 1 for East US (default)
provider "azurerm" {
  features {}
}

# Provider 2 for WestUS
provider "azurerm" {
  features {
    virtual_machine {
      delete_os_disk_on_deletion = false
    }
  }
  alias = "provider2-westus"
}

resource "azurerm_resource_group" "myrg1" {
    name = "myrg-1"
    location = "East US"
}

resource "azurerm_resource_group" "myrg2" {
    name = "myrg-2"
    location = "West US"
    # meta argument (scoped to this resrouce block) refers to above provider 2
    provider = azurerm.provider2-westus
}