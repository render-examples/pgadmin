FROM dpage/pgadmin4:9.10
USER root
RUN setcap -r /usr/bin/python3.11
ENV PGADMIN_LISTN_ADDRESS=0.0.0.0
ENV PGADMIN_DISABLE_POSTFIX=true
ENV PGADMIN_CONFIG_UPGRADE_CHECK_ENABLED=False
ENV PGADMIN_CONFIG_ENABLE_PSQL=True

COPY render-entrypoint.sh /render-entrypoint.sh
RUN chmod +x /render-entrypoint.sh

ENTRYPOINT ["/render-entrypoint.sh"]
