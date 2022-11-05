terraform {
  required_version = "~> 1.3.4"

  required_providers {
    snowflake = {
      source  = "Snowflake-Labs/snowflake"
      version = "~> 0.50.0"

      configuration_aliases = [
        snowflake.ingest_role
      ]
    }
  }
}
