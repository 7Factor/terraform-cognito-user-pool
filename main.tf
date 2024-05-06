terraform {
  required_version = ">=0.12.3"
}

data "aws_region" "current" {}

resource "aws_cognito_user_pool" "main_pool" {
  name = var.pool_name

  username_attributes        = var.username_attributes
  sms_authentication_message = var.sms_authentication_message

  password_policy {
    minimum_length                   = var.password_minimm_length
    require_lowercase                = var.password_require_lowercase
    require_uppercase                = var.password_require_uppercase
    require_numbers                  = var.password_require_numbers
    require_symbols                  = var.password_require_symbols
    temporary_password_validity_days = var.temporary_password_validity_days
  }

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only

    invite_message_template {
      email_message = var.invite_email_message
      email_subject = var.invite_email_subject
      sms_message   = var.invite_sms_message
    }
  }

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = var.schema_mutable

    dynamic "string_attribute_constraints" {
      for_each = var.string_attribute_constraints
      content {
        max_length = string_attribute_constraints.value["schema_string_max_length"]
        min_length = string_attribute_constraints.value["schema_string_min_length"]
      }
    }
  }

  # this guards against accidental deletion of user data until a way to restore backup is found
  lifecycle {
    prevent_destroy = true
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
