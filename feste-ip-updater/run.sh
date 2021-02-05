#!/usr/bin/env bashio

HOST_ID=$(bashio::config 'host_id')
HOST_PASSWORD=$(bashio::config 'host_password')
HOSTNAME=$(bashio::config 'hostname')

while true; do
    if answer="$(curl -sk --user ${HOST_ID}:${HOST_PASSWORD} "https://members.feste-ip.net/nic/update?hostname=${HOSTNAME}")"; then
        bashio::log.info "${answer}"
    else
        bashio::log.warning "${answer}"
    fi

    sleep 300
done
