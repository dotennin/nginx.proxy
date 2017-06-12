#!/bin/bash
#set -e

function replace {
  LC_ALL=C sed -i "s/$(echo $1 | sed -e 's/\([[\/.*]\|\]\)/\\&/g')/$(echo $2 | sed -e 's/[\/&]/\\&/g')/g" $3
}

if [[ $HTTPS_ONLY == true ]]; then
	replace "##https##" "" /etc/nginx/conf.d/default.conf
else
	replace "##http##" "" /etc/nginx/conf.d/default.conf
fi

replace "##NGINX_ROOT##" "${NGINX_ROOT:-localhost}" /etc/nginx/conf.d/default.conf

replace "##NGINX_SERVER_NAME##" "${NGINX_SERVER_NAME:-localhost}" /etc/nginx/conf.d/default.conf

replace "##NGINX_SERVER_NAME##" "${NGINX_SERVER_NAME:-localhost}" /etc/nginx/snippets/server_default.conf

exec "$@"
