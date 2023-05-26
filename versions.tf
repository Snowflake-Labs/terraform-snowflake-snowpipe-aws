terraform {
  required_version = ">= 1.4.6"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = ">= 0.64.0"

      configuration_aliases = [
        snowflake.ingest_role
      ]
    }
  }
}
