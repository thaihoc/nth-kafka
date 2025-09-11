#!/bin/bash

set -e

# Nếu storage chưa format thì tạo cluster id
if [ ! -f "/tmp/kraft-combined-logs/meta.properties" ]; then
  CLUSTER_ID=$(bin/kafka-storage.sh random-uuid)
  bin/kafka-storage.sh format -t "$CLUSTER_ID" -c config/kraft/server.properties
fi

exec "$@"