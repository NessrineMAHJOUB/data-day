environment_name              = "flink_env"
cluster_name                  = "cluster_0"
schema_registry_display_name  = "Stream Governance Package"

topics = [
    {"name": "purchase", "partitions": 1}
]

cloud_api_key              = "CLZPLL4HKG43BPU2"
cloud_api_secret           = "tbYuWWvMhkcrH3+FzZQdSEa+C628sIqDXlshlMFy/pqsb8yidjxfTDDx5X5ImS3d"

schema_registry_api_key    = "7ZKMU36Z4GWYK2XS"
schema_registry_api_secret = "UeksEAErSJTbOFuUBpTXsA7XUlGHc2yTfk3R4qFeZ1wfLrI3d3Zdx4zBUl7CBU/d"

schemas = [
    {"subject_name": "purchase-value"},
    {"subject_name": "purchase-key"},
]