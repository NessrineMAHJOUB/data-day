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