#!/bin/bash

set -e

# Nếu storage chưa format thì tạo cluster id
if [ ! -f "/tmp/kraft-combined-logs/meta.properties" ]; then
  CLUSTER_ID=$(bin/kafka-storage.sh random-uuid)
  bin/kafka-storage.sh format -t "$CLUSTER_ID" -c config/kraft/server.properties
fi

# Create new properties file
cp $KAFKA_HOME/config/kraft/server.properties $CONFIG_FILE

# Override properties
echo "advertised.listeners=$KAFKA_ADVERTISED_LISTENERS" >> $CONFIG_FILE

echo "[$(date +"%Y-%m-%d %H:%M:%S")][NTH][INFO] Created kafka configuration file at $CONFIG_FILE";

exec "$@"