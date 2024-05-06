// user pool config
variable "pool_name" {
  description = "The name of your cognito pool."
}

variable "allow_admin_create_user_only" {
  default     = false
  description = "Boolean value for whether you only want admins to be able to create users."
}

variable "username_attributes" {
  type        = list(string)
  default     = []
  description = "Needs to specify one of [email || phone_numeber]."
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
  type        = list(string)
  default     = []
  description = "A list of any auth flows for the user pool client."
}

variable "refresh_token_validity" {
  default     = 30
  description = "The time limit in days refresh tokens are valid for."
}

variable "read_attributes" {
  type        = list(string)
  default     = []
  description = "A list of read attributes for your user pool client."
}

variable "write_attributes" {
  type        = list(string)
  default     = []
  description = "A list of write attributes for your user pool client."
}

variable "sms_authentication_message" {
  type = string
  nullable = true
  default = null
  description = "String representing the SMS authentication message. The Message must contain the {####} placeholder, which will be replaced with the code."
}

variable "temporary_password_validity_days" {
  type = number
  nullable = true
  default = null
  description = "the number of days a temporary password is valid."
}

variable "schema_mutable" {
  type = bool
  nullable = true
  default = null
  description = "Whether the attribute can be changed once it has been created."
}

variable "schema_string_max_length" {
  type = number
  default = 2048
  description = "Maximum length of an attribute value of the string type."
}

variable "schema_string_min_length" {
  type = number
  default = 0
  description = "Minimum length of an attribute value of the string type."
}

variable "invite_email_message" {
  type = string
  nullable = true
  default = null
  description = "Message template for email messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
}

variable "invite_email_subject" {
  type = string
  nullable = true
  default = null
  description = "Subject line for email messages."
}

variable "invite_sms_message" {
  type = string
  nullable = true
  default = null
  description = "Message template for SMS messages. Must contain {username} and {####} placeholders, for username and temporary password, respectively."
}

