# snowflake_database.raw_fivetran will be destroyed
resource "snowflake_database" "raw_fivetran" {
  comment                     = "Unmodified source replicated data"
  data_retention_time_in_days = 1
  name                        = "RAW_DB_FIVETRAN"
}
