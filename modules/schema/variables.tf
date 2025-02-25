variable "schema_regsitry_id" {
  type = string
}

variable "schema_registry_endpoint" {
  type = string
}

variable "schema_registry_api_key" {
  type = string
}

variable "schema_registry_api_secret" {
  type = string
}

variable "schemas" {
  type = list(object({
    subject_name = string
  }))
}

variable "confluent_cloud_api_key" {
  type = string
}

variable "confluent_cloud_api_secret" {
  type = string
}