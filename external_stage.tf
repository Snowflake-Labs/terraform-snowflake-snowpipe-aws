resource "snowflake_stage" "this" {
  count    = var.create_stage ? 1 : 0
  provider = snowflake.ingest_role

  database = var.database_name
  schema   = var.schema_name
  name     = var.stage_name
  comment  = "${var.comment} - Stage"

  url                 = var.aws_s3_url
  storage_integration = var.storage_integration_name
  file_format         = "TYPE = ${var.file_format}"
}

data "snowflake_stages" "this" {
  provider = snowflake.ingest_role
  database = var.database_name
  schema   = var.schema_name
}
