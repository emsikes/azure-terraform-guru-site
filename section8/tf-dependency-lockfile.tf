# Terraform Block
terraform {
    required_version = ">= 1.0.0"
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = ">= 2.0"
        }
        random = {
            source = "hashicorp/random"
            version = " >=3.0"
        }
    }
}

# Provider Block
provider "azurerm" {
    features {}
}

# Azure Resource  Group
resource "azurerm_resource_group" "myrg1" {
    name = "myrg-1"
    location = "East US"
}

# Random String for Storage Account
resource "random_string" "myrandomstring" {
    length = 16
    special = false
    upper = false
}

# Azure Storage Account - alpha numeric only supported on Azure Storage Accounts
resource "azurerm_storage_account" "mysa" {
    name = "mysa${random_string.myrandomstring.id}"
    resource_group_name = azurerm_resource_group.myrg1.name
    location = azurerm_resource_group.myrg1.location
    account_tier = "Standard"
    account_replication_type = "LRS"
    tags = {
        "environment" = "test"
    }
}

