#!/bin/bash

# replace placeholders in nginx config file
envsubst "`printf '${%s} ' $(bash -c "compgen -A variable")`" < /default.tpl > /etc/nginx/conf.d/default.conf

# exec whatever was requested
exec "$@"
