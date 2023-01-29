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

# Create Virtual Networkß
resource "azurerm_virtual_network" "myvnet" {
    name = "myvnet"
    location = azurerm_resource_group.myrg1.location
    resource_group_name = azurerm_resource_group.myrg1.name
    address_space = [ "10.0.0.0/16" ]
    dns_servers = [ "8.8.8.8", "8.8.4.4" ]
    tags = {
        "name" = "myvnet"
        "environment" = "development"
    }
}

# Create Subnet
resource "azurerm_subnet" "mysubnet1" {
    name = "mysubnet1"
    resource_group_name = azurerm_resource_group.myrg1.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = [ "10.0.2.0/24" ]
}

# Create Public IP Address
resource "azurerm_public_ip" "mypublicip" {
    name = "mypublicip1"
    resource_group_name = azurerm_resource_group.myrg1.name
    location = azurerm_resource_group.myrg1.location
    allocation_method = "Static"

    tags = {
        "name" = "mypublicip1"
        "environment" = "developmentß"

    }
}

# Create Network Interface
resource "azurerm_network_interface" "myvmnic" {
    name = "vm-nic1"
    location = azurerm_resource_group.myrg1.location
    resource_group_name = azurerm_resource_group.myrg1.name

    ip_configuration {
        name = "internal"
        subnet_id = azurerm_subnet.mysubnet1.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id = azurerm_public_ip.mypublicip.id
    }
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