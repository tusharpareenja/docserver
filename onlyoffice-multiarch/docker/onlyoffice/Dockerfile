FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Patch nginx config to allow external access to /info/ endpoint
# Simple approach: just comment out the "deny all;" line in the /info/ location block
RUN sed -i '/location ~\* ^(\/\[0-9\]\+/,/^}/s/^  deny all;$/  # deny all;/' /etc/nginx/includes/ds-docservice.conf 2>/dev/null || true

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]