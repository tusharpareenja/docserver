#!/bin/bash

# Define the image names and tags
IMAGE_NAME="your-docker-repo/onlyoffice"
TAG_ARM64="latest-arm64"
TAG_AMD64="latest-amd64"

# Build and push ARM64 image
echo "Building ARM64 image..."
docker build -f ../docker/onlyoffice/Dockerfile.arm64 -t ${IMAGE_NAME}:${TAG_ARM64} ../

echo "Pushing ARM64 image..."
docker push ${IMAGE_NAME}:${TAG_ARM64}

# Build and push AMD64 image
echo "Building AMD64 image..."
docker build -f ../docker/onlyoffice/Dockerfile -t ${IMAGE_NAME}:${TAG_AMD64} ../

echo "Pushing AMD64 image..."
docker push ${IMAGE_NAME}:${TAG_AMD64}

echo "Multi-architecture images pushed successfully."