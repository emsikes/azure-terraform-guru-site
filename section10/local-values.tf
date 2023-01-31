# Local values for tagging based on variables set in generic_input_variables.tf

locals {
    owners = var.business_division
    environment = var.environment
    resource_name_prefix = "${var.business_division}-${var.environment}"
    common_tags = {
        owners = local.owners,
        environment = local.environment
    }
}

# We can access the above to create stabdard taggin and names
#
# name = "${local.resource_name_prefix}-vnet"
# 
# result: sap-dev-vnet