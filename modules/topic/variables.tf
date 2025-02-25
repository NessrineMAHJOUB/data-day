######################################################################### Cluster
variable "topics" {
  type = list(
    object({
      name        = string
      partitions  = number
    })
  )
  description = "List of topics to create."
}

variable "cluster_id" {
  type = string
}

variable "rest_endpoint" {
  type = string
}

variable "confluent_cloud_api_key" {
  type = string
}

variable "confluent_cloud_api_secret" {
  type = string
}
