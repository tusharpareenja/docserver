FROM onlyoffice/documentserver:latest

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

# Set up OnlyOffice Document Server
COPY ./configs/onlyoffice/local.json /etc/onlyoffice/local.json

# Expose necessary ports
EXPOSE 80 443

# Start OnlyOffice Document Server
CMD ["bash", "/usr/local/bin/ds.run"]