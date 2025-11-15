FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Patch nginx config to allow external access to /info/ endpoint
# The base image installs nginx, so we patch the config after FROM
RUN if [ -f /etc/nginx/includes/ds-docservice.conf ]; then \
      sed -i 's/^  allow 127\.0\.0\.1;$/  # allow 127.0.0.1;/g' /etc/nginx/includes/ds-docservice.conf && \
      sed -i 's/^  deny all;$/  # deny all;/g' /etc/nginx/includes/ds-docservice.conf && \
      echo "✓ nginx config patched to allow /info/ access"; \
    else \
      echo "⚠ Warning: nginx config not found"; \
    fi

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]