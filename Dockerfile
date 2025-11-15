# Use the official pgAdmin 9.10 image
FROM dpage/pgadmin4:9.10

# Run as root to allow any setup changes
USER root

# Environment variables
ENV PGADMIN_LISTEN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true
ENV PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False
ENV PGADMIN_CONFIG_ENABLE_PSQL=True

# Copy custom entrypoint
COPY render-entrypoint.sh /render-entrypoint.sh
RUN chmod +x /render-entrypoint.sh

# Use the custom entrypoint
ENTRYPOINT ["/render-entrypoint.sh"]

