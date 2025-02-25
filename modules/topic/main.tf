######################################################################### Topics
resource "confluent_kafka_topic" "topic" {
  for_each          = {for topic in var.topics : topic.name => topic}

  kafka_cluster {
    id = var.cluster_id
  }

  topic_name        = each.value.name
  partitions_count  = each.value.partitions

  rest_endpoint = var.rest_endpoint
}

