# Use official pgAdmin image
FROM dpage/pgadmin4:9.10

# Switch to root to set environment variables
USER root

# Environment variables for pgAdmin
ENV PGADMIN_LISTEN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true
ENV PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False
ENV PGADMIN_CONFIG_ENABLE_PSQL=True

# Copy your entrypoint script
COPY render-entrypoint.sh /render-entrypoint.sh

# Make the script executable (this is allowed)
RUN chmod +x /render-entrypoint.sh

# Use the custom entrypoint
ENTRYPOINT ["/render-entrypoint.sh"]

