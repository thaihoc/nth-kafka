# Hướng dẫn cài đặt Kafka sử dụng Podman

Download Kafka vào thư mục project của bạn: https://archive.apache.org/dist/kafka/3.7.0/kafka_2.13-3.7.0.tgz

Build image:

```bash
podman build -t nth-kafka:3.7.0-kraft .
```

Run Kafka:

```bash
podman run --name kafka37 -p 9092:9092 nth-kafka:3.7.0-kraft
```

Kiểm tra Kafka đã hoạt động:

```bash
podman exec -it kafka37 kafka-topics.sh --bootstrap-server localhost:9092 --create --topic test --partitions 1 --replication-factor 1

podman exec -it kafka37 kafka-topics.sh --bootstrap-server localhost:9092 --list

podman exec -it kafka37 kafka-topics.sh --bootstrap-server localhost:9092 --delete --topic test
```

## Tham khảo

Tài liệu Kafka v3.7.0: https://kafka.apache.org/37/documentation.html