// user pool config
variable "pool_name" {
  description = "The name of your cognito pool."
}

variable "alias_attributes" {
  type        = list
  default     = []
  description = "A list of alias attributes for your cognito pool."
}

variable "allow_admin_create_user_only" {
  default     = false
  description = "Boolean value for whether you only want admins to be able to create users."
}

// schema attributes
variable "schema_attributes" {
  type        = list
  default     = []
  description = "A list of maps that configures your schema attributes. Please look to the terraform docs for more info."
}

// password policy
variable "password_minimm_length" {
  default     = 6
  description = "The minimum allowed length of user passwords."
}

variable "password_require_lowercase" {
  default     = false
  description = "Boolean value for if lowercase characters are required for user passwords."
}

variable "password_require_uppercase" {
  default     = false
  description = "Boolean value for if uppercase characters are required for user passwords."
}

variable "password_require_numbers" {
  default     = false
  description = "Boolean value for if numbers are required for user passwords."
}

variable "password_require_symbols" {
  default     = false
  description = "Boolean value for if symbols are required for user passwords."
}

// user pool client config
variable "pool_client_name" {
  description = "The name of the client pool.d"
}

variable "explicit_auth_flows" {
  type        = list
  default     = []
  description = "A list of any auth flows for the user pool client."
}

variable "refresh_token_validity" {
  default     = 30
  description = "The time limit in days refresh tokens are valid for."
}

variable "read_attributes" {
  type        = list
  default     = []
  description = "A list of read attributes for your user pool client."
}

variable "write_attributes" {
  type        = list
  default     = []
  description = "A list of write attributes for your user pool client."
}
