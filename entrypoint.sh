#!/usr/bin/env bash

set -e

echo "Сhecks of existence config dir..."
if [ ! -d "/etc/nginx" ]; then
    echo "Config dir is not found!!! Recovery from original default config..."
    cp -R /etc/nginx.origin /etc/nginx
fi

echo "Checks of empty config dir..."
if [ -z "$(ls -A /etc/nginx)" ]; then
    echo "Config dir is empty!!! Recovery from original default config..."
    cp -R /etc/nginx.origin/* /etc/nginx
fi

echo "Сhecks of existence html dir..."
if [ ! -d "/var/www/html" ]; then
    echo "Data dir is not found!!! Recovery from original default html..."
    cp -R /var/www/html.origin /var/www/html
fi

echo "Checks of empty html dir..."
if [ -z "$(ls -A /var/www/html)" ]; then
    echo "Data dir is empty!!! Recovery from original default html..."
    cp -R /var/www/html.origin/* /var/www/html
fi

echo "Executing command..."
# exec $@
/usr/sbin/nginx -c /etc/nginx/nginx.conf -t && \
exec /usr/sbin/nginx -c /etc/nginx/nginx.conf -g "daemon off;"
