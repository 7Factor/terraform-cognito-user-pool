terraform {
  required_version = ">=0.12.3"
}

data "aws_region" "current" {}

resource "aws_cognito_user_pool" "main_pool" {
  name = var.pool_name

  alias_attributes = [var.alias_attributes]

  password_policy {
    minimum_length    = var.password_minimm_length
    require_lowercase = var.password_require_lowercase
    require_uppercase = var.password_require_uppercase
    require_numbers   = var.password_require_numbers
    require_symbols   = var.password_require_symbols
  }

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  schema {
    attribute_data_type = lookup(var.schema_attributes[count.index], "attribute_data_type", "")
    name                = lookup(var.schema_attributes[count.index], "name", "")

    required                 = false
    mutable                  = true
    developer_only_attribute = false

    string_attribute_constraints {}
  }
}

resource "aws_cognito_user_pool_client" "main_client" {
  name                   = var.pool_client_name
  user_pool_id           = aws_cognito_user_pool.main_pool.id
  refresh_token_validity = var.refresh_token_validity

  explicit_auth_flows = [var.explicit_auth_flows]

  read_attributes  = [var.read_attributes]
  write_attributes = [var.write_attributes]
}
