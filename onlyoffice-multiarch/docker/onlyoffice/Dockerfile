FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Allow external access to /info/ and /web-apps/ by patching nginx config
# Comment out the deny rules to enable public access to these endpoints
RUN sed -i 's/^  allow 127.0.0.1;$/  # allow 127.0.0.1;/g' /etc/nginx/includes/ds-docservice.conf && \
    sed -i 's/^  deny all;$/  # deny all;/g' /etc/nginx/includes/ds-docservice.conf

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]