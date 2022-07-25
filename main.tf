terraform {
  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.35"
    }
  }
}

provider "snowflake" {
  role = "SYSADMIN"
}

resource "snowflake_database" "db" {
  name = "FIVETRAN_DB"
}
