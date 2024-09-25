terraform {
  required_version = ">= 1.9.6"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">= 0.96.0"

      configuration_aliases = [
        snowflake.ingest_role
      ]
    }
  }
}
