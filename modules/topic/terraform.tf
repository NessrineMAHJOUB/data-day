terraform {
  required_version = ">= 1.8"
  required_providers {
    confluent = {
      source  = "confluentinc/confluent"
      version = "~> 2.11.0"
    }
  }
}
