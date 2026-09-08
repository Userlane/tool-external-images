# infra-analytics-core
# PLT-3229 hop 1 needs two 0.37.0 tags: -kafka-3.4.0 for the cluster, ZooKeeper and both
# KafkaConnect clusters, and -kafka-3.5.1 because 3.5.1 is 0.37.0's default Kafka version
# and so backs the tls-sidecar, kafka-exporter and cruise-control images.
# The workflow builds one tag per directory per push, so the two arrived in separate
# commits. Both tags are in the registry; this file records which.
# FROM quay.io/strimzi/kafka:0.37.0-kafka-3.4.0
# FROM quay.io/strimzi/kafka:0.34.0-kafka-3.4.0
# FROM quay.io/strimzi/kafka:0.34.0-kafka-3.3.1
# FROM quay.io/strimzi/kafka:0.34.0-kafka-3.3.2
FROM quay.io/strimzi/kafka:0.37.0-kafka-3.5.1
