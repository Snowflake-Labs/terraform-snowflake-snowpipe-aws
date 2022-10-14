output "stage_name" {
  description = "Snowflake stage name"
  value       = var.create_stage == true ? snowflake_stage.this[0].name : join("", [ for x in data.snowflake_stages.this.stages: x.name if x.name == var.stage_name ])
}

output "pipe_name" {
  description = "Snowflake pipe name"
  value       = snowflake_pipe.this.name
}
