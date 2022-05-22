#!/bin/bash

# build docker image for openam
docker build  --no-cache \
    --file Dockerfile \
    --tag webento/openam:latest \
    --tag webento/openam \
    .

docker push webento/openam:latest
