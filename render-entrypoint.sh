#!/bin/sh

chown pgadmin:root /var/lib/pgadmin

# pgadmin will setup initial servers based on the default email of the user
# the path has the @ symbol replaced with an underscore
storage_path=/var/lib/pgadmin/storage/$(echo $PGADMIN_DEFAULT_EMAIL | sed 's/@/_/g')
sudo -u pgadmin mkdir -p -m 00775 $storage_path

# render secret files are owned by root so we need to copy them over with the
# appropriate user / group / permissions for pgadmin to read the initial servers file
install -o pgadmin -g root -m 00755 /etc/secrets/servers.json /var/lib/pgadmin/storage/
# postgres requires the pgpassfile to have specific permissions for security purposes
install -o pgadmin -g root -m 0600 /etc/secrets/pgpassfile $storage_path

sudo -Eu pgadmin /entrypoint.sh
