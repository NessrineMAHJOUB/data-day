### Loads targeted environment
data "confluent_environment" "environment" {
  id  = "env-qp0oy6"
}

### Load cluster in the target environment
data "confluent_kafka_cluster" "cluster" {
  display_name =  var.cluster_name
  environment {
    id = data.confluent_environment.environment.id
  }
}

### Loads the schema registry cluster in the target environment
data "confluent_schema_registry_cluster" "schema_registry" {
  display_name = var.schema_registry_display_name
  environment {
    id = data.confluent_environment.environment.id
  }
}

########################################################################## topic
module "topic" {
  source                = "./modules/topic"

  cluster_id                 = data.confluent_kafka_cluster.cluster.id
  rest_endpoint              = data.confluent_kafka_cluster.cluster.rest_endpoint
  topics                     = var.topics

  confluent_cloud_api_key    = var.cloud_api_key
  confluent_cloud_api_secret = var.cloud_api_secret
}

################################################################ schema registry
module "schema" {
  source                      = "./modules/schema"

  schema_regsitry_id          = data.confluent_schema_registry_cluster.schema_registry.id
  schema_registry_endpoint    = data.confluent_schema_registry_cluster.schema_registry.rest_endpoint

  schemas                     = var.schemas
  schema_registry_api_key     = var.schema_registry_api_key
  schema_registry_api_secret  = var.schema_registry_api_secret

  confluent_cloud_api_key    = var.cloud_api_key
  confluent_cloud_api_secret = var.cloud_api_secret
}



