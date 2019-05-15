pool_name = "test-pool1"
schema_attributes = [
  {
    attribute_data_type = "String"
    name                = "customeattr1"
  },
  {
    attribute_data_type = "String"
    name                = "customeattr"
  }
]
// alias attributes needs to be one of phone_number, email, preferred_username.
alias_attributes = ["preferred_username"]
allow_admin_create_user_only = "true"

pool_client_name = "Test_app_1"
explicit_auth_flows = ["ADMIN_NO_SRP_AUTH"]

write_attributes = []