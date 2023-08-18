setup() {
  bats_load_library bats-support
  bats_load_library bats-assert
  source "./credentials/pass.sh"
}

@test "can run our function" {
  pass_password example3
  assert_equal $EXAMPLE3_USERNAME bob
  assert_equal $EXAMPLE3_PASSWORD fooo4
}
