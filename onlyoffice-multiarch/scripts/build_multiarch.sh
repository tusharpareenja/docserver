#!/bin/bash

# Set the architectures
ARCHS=("amd64" "arm64")

# Build images for each architecture
for ARCH in "${ARCHS[@]}"; do
    echo "Building Docker image for architecture: $ARCH"
    
    if [ "$ARCH" == "arm64" ]; then
        docker buildx build --platform linux/arm64 -t yourusername/onlyoffice:arm64 -f docker/onlyoffice/Dockerfile.arm64 .
    else
        docker buildx build --platform linux/amd64 -t yourusername/onlyoffice:amd64 -f docker/onlyoffice/Dockerfile .
    fi
done

echo "Multi-architecture Docker images built successfully."