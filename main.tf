terraform {
  required_version = ">=0.12.3"
}

data "aws_region" "current" {}

variable "username_attributes" {
  type = list(string)
  default = []
  description = "A list specifying whether email addresses or phone numbers can be specified as usernames when a a user signs up."
}
resource "aws_cognito_user_pool" "main_pool" {
  name = var.pool_name

  username_attributes = var.username_attributes

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
}

resource "aws_cognito_user_pool_client" "main_client" {
  name                   = var.pool_client_name
  user_pool_id           = aws_cognito_user_pool.main_pool.id
  refresh_token_validity = var.refresh_token_validity

  explicit_auth_flows = var.explicit_auth_flows

  read_attributes  = var.read_attributes
  write_attributes = var.write_attributes
}
