resource "snowflake_user" "user" {
  name                   = "intern"
  comment                = "for testing"
  enable_multiple_grants = "true"
}

resource "snowflake_user" "user2" {
  name                   = "dev"
  comment                = "for testing"
  enable_multiple_grants = "true"
}

resource "snowflake_role" "role" {
  name                   = "intern_test_role"
  comment                = "for testing"
  enable_multiple_grants = "true"
}

resource "snowflake_role" "other_role" {
  name                   = "dev_test_role2"
  enable_multiple_grants = "true"
}

resource "snowflake_role_grants" "grants" {
  role_name = snowflake_role.role.name

  roles = [
    "${snowflake_role.other_role.name}",
  ]

  users = [
    "${snowflake_user.user.name}",
    "${snowflake_user.user2.name}",
  ]
}
