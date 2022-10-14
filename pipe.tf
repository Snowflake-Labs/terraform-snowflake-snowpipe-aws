locals {
  copy_statement = <<-EOF
                        %{ if length(var.custom_ingest_columns) > 0 }
                        COPY INTO ${var.database_name}.${var.schema_name}.${var.table_name}(
                          ${lookup(var.custom_ingest_columns, "target_columns")}
                        )
                        FROM (
                          SELECT ${lookup(var.custom_ingest_columns, "source_columns")}
                          FROM @${var.database_name}.${var.schema_name}.${var.stage_name}
                        )
                        %{ else }
                        COPY INTO ${var.database_name}.${var.schema_name}.${var.table_name}
                        FROM @${var.database_name}.${var.schema_name}.${var.stage_name}
                        %{ endif }
                      EOF
}


resource "snowflake_pipe" "this" {
  provider = snowflake.snowpipe_ingest_role
  database = var.database_name
  schema   = var.schema_name
  name     = var.pipe_name
  comment  = "${var.comment} - pipe"

  auto_ingest       = var.pipe_enable
  aws_sns_topic_arn = var.aws_sns_topic_arn

  copy_statement = trimspace(local.copy_statement)

  depends_on = [
    snowflake_stage.this
  ]
}
