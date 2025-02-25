#################################################################### Environment
variable "environment_id" {
  description = "Environment name."
  type        = string
}

variable "cluster_name" {
  description = "Cluster name."
  type        = string
}

################################################################## Cloud api key
variable "cloud_api_key" {
  description = "Confluent Cloud API key (also referred as Cloud API ID)."
  type        = string
  sensitive   = true
}

variable "cloud_api_secret" {
  description = "Confluent Cloud API secret."
  type        = string
  sensitive   = true
}

######################################################################### Topics
variable "topics" {
  type = list(
    object({
      name        = string
      partitions  = number
    })
  )
}

variable "schemas" {
  type = list(object({
    subject_name = string
  }))
}

################################################################ Service account
variable "service_account_list" {
  type        = list(string)
  description = "List of service account to used. Workaround that allow to create on true environment and consume to logial environment."
  default     = []
}

################################################################ Schema-registry
variable "schema_registry_api_key" {
  description = "Schema registry api key."
  type        = string
  sensitive   = true
}
variable "schema_registry_api_secret" {
  description = "Schema registry api secret."
  type        = string
  sensitive   = true
}
variable "schema_registry_id" {
  type        = string
}

variable "kafka_api_key" {
  type        = string
}

variable "kafka_api_secret" {
  type        = string
}