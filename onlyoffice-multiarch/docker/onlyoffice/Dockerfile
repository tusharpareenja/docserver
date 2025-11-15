FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Patch nginx config to allow external access to /info/ endpoint
# Use a targeted sed to only modify the /info/ location block (change "deny all;" to "# deny all;")
RUN sed -i '/location ~\* ^(\/\[\\d\]\+\\./ { /info/ { s/^  deny all;$/  # deny all;/ } }' /etc/nginx/includes/ds-docservice.conf || \
    echo "Note: nginx patch may need to be applied at runtime if file doesn't exist yet"

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]