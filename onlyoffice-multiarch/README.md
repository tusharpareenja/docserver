# OnlyOffice Multi-Architecture Setup

This project provides a multi-architecture setup for deploying OnlyOffice along with its dependencies, including RabbitMQ, PostgreSQL, and Redis. The setup is designed to work on both ARM and Intel architectures, allowing for flexibility in deployment environments.

## Project Structure

The project is organized as follows:

```
onlyoffice-multiarch
├── docker
│   └── onlyoffice
│       ├── Dockerfile
│       └── Dockerfile.arm64
├── compose
│   ├── docker-compose.yml
│   ├── docker-compose.arm64.yml
│   └── docker-compose.amd64.yml
├── .github
│   └── workflows
│       └── build-and-push.yml
├── configs
│   ├── onlyoffice
│   │   └── local.json
│   ├── rabbitmq
│   │   └── rabbitmq.conf
│   ├── postgres
│   │   └── postgres.conf
│   └── redis
│       └── redis.conf
├── scripts
│   ├── build_multiarch.sh
│   └── push_multiarch.sh
├── .env.example
└── README.md
```

## Getting Started

### Prerequisites

- Docker and Docker Compose installed on your machine.
- Access to a terminal or command line interface.

### Building the Docker Images

To build the Docker images for both architectures, you can use the provided scripts:

1. **For ARM64 Architecture:**
   Navigate to the project directory and run:
   ```
   ./scripts/build_multiarch.sh arm64
   ```

2. **For AMD64 Architecture:**
   Run:
   ```
   ./scripts/build_multiarch.sh amd64
   ```

### Running the Application

To run the application using Docker Compose, you can use the following commands:

- **For ARM64:**
  ```
  docker-compose -f compose/docker-compose.arm64.yml up
  ```

- **For AMD64:**
  ```
  docker-compose -f compose/docker-compose.amd64.yml up
  ```

### Configuration

Configuration files for OnlyOffice, RabbitMQ, PostgreSQL, and Redis are located in the `configs` directory. You can modify these files to suit your environment.

### CI/CD Integration

The project includes a GitHub Actions workflow located in `.github/workflows/build-and-push.yml` for automatically building and pushing Docker images to a container registry. Ensure that your repository is set up with the necessary secrets for authentication.

## Conclusion

This multi-architecture setup allows you to deploy OnlyOffice and its dependencies seamlessly across different server architectures. For further customization and advanced configurations, refer to the individual service documentation.