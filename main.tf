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

}