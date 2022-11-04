locals {
  copy_statement = <<-EOF
%{if length(var.custom_ingest_columns) > 0}
COPY INTO ${var.database_name}.${var.schema_name}.${var.destination_table_name}(
    ${join(", ", var.custom_ingest_columns["target_columns"])}
)
FROM (
    SELECT ${join(", ", var.custom_ingest_columns["source_columns"])}
    FROM @${var.database_name}.${var.schema_name}.${var.stage_name}
)
%{else}
COPY INTO ${var.database_name}.${var.schema_name}.${var.destination_table_name}
FROM @${var.database_name}.${var.schema_name}.${var.stage_name}
%{endif}
EOF
}

resource "snowflake_pipe" "this" {
  provider = snowflake.ingest_role

  database = var.database_name
  schema   = var.schema_name
  name     = var.pipe_name

  auto_ingest       = var.auto_ingest
  aws_sns_topic_arn = var.aws_sns_topic_arn
  error_integration = var.notification_integration_name

  copy_statement = trimspace(local.copy_statement)

  comment = var.comment
  depends_on = [
    snowflake_stage.this
  ]
}
