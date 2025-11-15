#!/bin/bash
set -e

# Patch nginx config to allow external access to /info/ and /web-apps/
# This runs at container startup, after the base image has installed nginx
echo "Patching nginx config to allow external access to /info/ endpoint..."

if [ -f /etc/nginx/includes/ds-docservice.conf ]; then
  # Comment out the deny rules to enable public access
  sed -i 's/^  allow 127\.0\.0\.1;$/  # allow 127.0.0.1;/g' /etc/nginx/includes/ds-docservice.conf
  sed -i 's/^  deny all;$/  # deny all;/g' /etc/nginx/includes/ds-docservice.conf
  echo "✓ nginx config patched successfully"
else
  echo "⚠ Warning: nginx config file not found at /etc/nginx/includes/ds-docservice.conf"
  echo "  Proceeding without patching..."
fi

# Run the original OnlyOffice entrypoint/startup script
echo "Starting OnlyOffice DocumentServer..."
exec /app/ds/run-documentserver
