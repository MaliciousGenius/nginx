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

echo "Executing command..."
exec $@
