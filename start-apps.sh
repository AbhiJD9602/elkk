#!/usr/bin/env bash

echo
echo "Starting application..."

docker run -d --rm --name application \
  -p 9082:9082 --network elkk_default -e ZIPKIN_HOST=zipkin \
      --health-cmd="curl -f http://localhost:9082/actuator/health || exit 1" --health-start-period=1m \
  application
