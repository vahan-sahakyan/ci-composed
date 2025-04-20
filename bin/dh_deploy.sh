#!/bin/bash

if [[ "$1" != "backend" && "$1" != "frontend" && "$1" != "ws" ]]; then
    echo "Error: Argument must be either 'backend', 'frontend', or 'ws'."
    exit 1
fi

docker build -t vahansahakyanop/code-inspect-$1 _$1

if [ $? -ne 0 ]; then
    echo "Error: Docker build failed."
    exit 1
fi

docker push vahansahakyanop/code-inspect-$1