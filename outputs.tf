output "user_pool_attributes" {
  value = "${aws_cognito_user_pool.main_pool.*.schema}"
}

output "pool_id" {
  value = "${aws_cognito_user_pool.main_pool.id}"
}

output "app_client_id" {
  value = "${aws_cognito_user_pool_client.main_client.id}"
}

output "region" {
  value = "${data.aws_region.current.name}"
}
