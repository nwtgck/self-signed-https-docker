#! /bin/sh

# Assign environment variables
cat /etc/nginx/conf.d/default.conf | envsubst  '$TARGET_HOST $TARGET_PORT' > /etc/nginx/conf.d/default.conf
# Start Nginx
nginx -g "daemon off;"
