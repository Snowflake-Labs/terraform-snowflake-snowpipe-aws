# terraform-snowflake-snowpipe-aws

Terraform module for creating Snowpipe to ingest data from AWS S3 bucket.

## Required parameters

| Parameter                | Description                                                        |
| ------------------------ | ------------------------------------------------------------------ |
| database_name            | The name of an existing Snowflake database                         |
| schema_name              | The name of an existing Snowflake schema in the database above     |
| stage_name               | The name of the Snowflake stage to create                          |
| pipe_name                | The name of the Snowflake pipe to create                           |
| comment                  | Comment text                                                       |
| aws_s3_url               | The AWS S3 url to the directory of the source files to be ingested |
| aws_sns_topic_arn        | AWS SNS topic ARN from the Snowflake storage integration           |
| storage_integration_name | The name of an existing Snowflake storage integration              |
| destination_table_name   | The name of an existing table for the data to be ingested into     |

## Optional parameters

| Parameter             | Description                                                                                                                                                                                                                                    |
| --------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| create_stage          | Default is "true". Set to "false" to use an existing stage and not creaete a new one.                                                                                                                                                          |
| file_format           | Default is "TYPE = JSON NULL_IF = []". Source file format and options.                                                                                                                                                                                                         |
| auto_ingest           | Default is "true". Set to "false" to disable auto-ingest for the pipe                                                                                                                                                                          |
| custom_ingest_columns | Key value map, 'source_columns' and 'target_columns', containing comma separated table columns.<pre>Example1:<br>custom_ingest_columns = {<br> target_columns = ["recorded_at", "response"]<br> source_columns = ["CURRENT_TIMESTAMP", "$1"]<br>}<br>Example2:<br>custom_ingest_columns = {<br> target_columns = []<br> source_columns = ["CURRENT_TIMESTAMP", "$1"]<br>}</pre> |
