# Resource 1: Azure Resource Group

resource "azurerm_resource_group" "rg" {
    # This will create a unique rg name each apply by appending standard naming from var local and random
    name = "${local.resource_name_prefix}-${var.resource_group_name}-${random.string.myrandom.id}"
    location =var.resource_group_location
    tags = local.common_tags
}