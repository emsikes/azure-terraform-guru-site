# Generic Input Variables

# Business Division Variables
variable "business_division" {
    description = "Business Divsion this infrastructure belongs to"
    type = string
    default = "sap"
}
# Environment Variables
variable "environment" {
    description = "Environment Variable used as a prefix for the resource"
    default = "dev"
}
# Azure Resource Group Name
variable "resource_group_name" {
    description = "Resource Group Name"
    default = "rg-default"
}
# Azure Resource Location
variable "resource_group_location" {
    description = "Azure region where resources are created"
    default = "eastus2"
}