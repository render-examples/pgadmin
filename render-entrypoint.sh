#!/bin/bash
set -e

# Optional: fix ownership/permissions if needed
# Example: if you mount a volume for data
# chown -R pgadmin:pgadmin /var/lib/pgadmin

# Call the base image entrypoint to start pgAdmin
exec /entrypoint.sh "$@"
