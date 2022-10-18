variable "database_name" {
  description = "Snowflake database name."
  type        = string
}

variable "schema_name" {
  description = "Snowflake schema name."
  type        = string
}

variable "stage_name" {
  description = "Stage name."
  type        = string
}

variable "create_stage" {
  description = "Create new stage or use an existing stage."
  type        = bool
  default     = true
}

variable "pipe_name" {
  description = "Name of the pipe."
  type        = string
}

variable "auto_ingest" {
  description = "Enable auto-ingest for the pipe."
  type        = bool
  default     = true
}

variable "comment" {
  description = "Comment text."
  type        = string
}

variable "aws_sns_topic_arn" {
  description = "AWS SNS topic ARN."
  type        = string
}

variable "aws_s3_url" {
  description = "AWS S3 url to the source directory."
  type        = string
}

variable "storage_integration_name" {
  description = "Storage integration."
  type        = string
}

variable "destination_table_name" {
  description = "Destination table name."
  type        = string
}

variable "custom_ingest_columns" {
  description = "Key value map, 'source_columns' and 'target_columns', containing comma separated table columns."
  type        = map(list(string))
  default     = {}
}

variable "file_format" {
  description = "Source file format."
  type        = string
  default     = "JSON"
}
