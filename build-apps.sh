#!/usr/bin/env bash

./gradlew :application:clean build


set -eo pipefail

modules=( application )

for module in "${modules[@]}"; do
    docker build -t "elkk/${module}:latest" ${module}
done