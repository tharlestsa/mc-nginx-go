#!/bin/bash
set -e

FASTCGI_HOSTNAME="${MAPAS_HOSTNAME:-mapasculturais}"
FASTCGI_PORT="${MAPAS_PORT:-9000}"

#sed "s/mapasculturais\:9000/$FASTCGI_HOSTNAME\:$FASTCGI_PORT/g" /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"