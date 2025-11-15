FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Override nginx config to allow external access to /info/ and /internal/
# Copy a patched version that removes the restrictive allow 127.0.0.1; deny all; rules
COPY ./configs/nginx/ds-docservice.conf /etc/nginx/includes/ds-docservice.conf

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]