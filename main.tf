terraform {
  required_version = ">= 0.15.0"

  backend "remote" {
    organization = "jamessopkin"

    workspaces {
      name = "snowflake"
    }
  }

  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.32.0"
    }
  }
}

data "terraform_remote_state" "core" {
  backend = "remote"

  config = {
    organization = "jamessopkin"

    workspaces = {
      name = "snowflake"
    }
  }
}


provider "snowflake" {
  account  = "mt35412"
  region   = "us-east-2"
  role     = "SECURITYADMIN"
  alias    = "security"
  username = var.SNOWFLAKE_USER
  password = var.SNOWFLAKE_PASSWORD
}

provider "snowflake" {
  account  = "mt35412"
  region   = "us-east-2"
  role     = "SYSADMIN"
  alias    = "system"
  username = var.SNOWFLAKE_USER
  password = var.SNOWFLAKE_PASSWORD
}
