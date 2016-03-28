#!/bin/bash
set -e

if [[ "$1" == "harpoon" && "$2" == "start" ]]; then
  status=`harpoon inspect $BITNAMI_APP_NAME`
  if [[ "$status" == *'"lifecycle": "unpacked"'* ]]; then
    harpoon initialize $BITNAMI_APP_NAME \
      ${MEMCACHED_USER:+--username $MEMCACHED_USER} \
      ${MEMCACHED_PASSWORD:+--password $MEMCACHED_PASSWORD}
  fi
fi

exec /entrypoint.sh "$@"
