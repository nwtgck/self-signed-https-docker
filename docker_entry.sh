#! /bin/sh

# Set default value if not set
export SERVER_HTTP_PORT=${SERVER_HTTP_PORT-"80"}
export SERVER_HTTPS_PORT=${SERVER_HTTPS_PORT-"443"}
export TARGET_PORT=${TARGET_PORT-"80"}

# Assign environment variables
cat /etc/nginx/conf.d/default.conf | envsubst  '$SERVER_HTTP_PORT $SERVER_HTTPS_PORT $TARGET_HOST $TARGET_PORT' > /tmp/filled.conf
mv /tmp/filled.conf /etc/nginx/conf.d/default.conf

# If server.key or server.crt doesn't exist.
mkdir -p /ssl_certs
if [ ! -e /ssl_certs/server.key ] || [ ! -e /ssl_certs/server.crt ]; then
  cd /ssl_certs
  openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"
  openssl x509 -days 3650 -req -signkey server.key < server.csr > server.crt
  chown root:root server.key  server.csr server.crt
  cd /
fi

echo "Running Self-signed HTTPS ..."

# Start Nginx
nginx -g "daemon off;"
