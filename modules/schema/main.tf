resource "confluent_schema" "schema" {
  for_each = {for schema in var.schemas : schema.subject_name => schema}

  schema_registry_cluster {
    id = var.schema_regsitry_id
  }

  rest_endpoint = var.schema_registry_endpoint
  subject_name  = each.value.subject_name
  format       = "AVRO"
  schema       = file("./schemas/avro/${each.value.subject_name}.avsc")

  credentials {
    key    = var.schema_registry_api_key
    secret = var.schema_registry_api_secret
  }
}