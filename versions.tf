terraform {
  required_version = ">= 1.2.0"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.47.0"

      configuration_aliases = [
        snowflake.ingest_role
      ]
    }
  }
}
