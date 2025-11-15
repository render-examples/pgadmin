#!/bin/sh
set -e

# Set storage path for the default user email
storage_path="/var/lib/pgadmin/storage/$(echo $PGADMIN_DEFAULT_EMAIL | sed 's/@/_/g')"

# Create storage path (use mkdir without sudo, container allows this path)
mkdir -p -m 00775 "$storage_path"

# Copy secret files (ensure pgadmin owns them)
cp /etc/secrets/servers.json "$storage_path/"
cp /etc/secrets/pgpassfile "$storage_path/"
chmod 0600 "$storage_path/pgpassfile"

# Start pgAdmin as the default user in the container
exec /usr/pgadmin4/pgAdmin4.py
