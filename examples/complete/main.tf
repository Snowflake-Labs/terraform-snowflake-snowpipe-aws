module "my_snowpipe" {
  source = "../../"

  database_name = var.database_name
  schema_name   = var.schema_name
  stage_name    = var.stage_name
  pipe_name     = var.pipe_name

  aws_s3_url               = module.sds_dbt_storage_integration.bucket_url
  aws_sns_topic_arn        = var.aws_sns_topic_arn
  storage_integration_name = var.storage_integration_name

  destination_table_name = var.destination_table_name
  custom_ingest_columns = {
    target_columns = [
      "RECORDED_AT",
      "RESPONSE",
    ]
    source_columns = [
      "CURRENT_TIMESTAMP",
      "$1",
    ]
  }

  comment = "Ingest Pipe."
  providers = {
    snowflake.ingest_role = snowflake.ingest_role
  }
}
