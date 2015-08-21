#!/bin/bash

etcdctl setdir CP
etcdctl set /CP/CP_APPLICATIONS "$CAPCOM_APPS"
etcdctl set /CP/CP_HOST 127.0.0.1
etcdctl set /CP/CP_DB_PATH ./capcom.db
etcdctl set /CP/CP_KV_STORE_SERVER_ADDRESS  http://$CAPCOM_KV_ENDPOINT
etcdctl set /CP/CP_KV_TTL 10
etcdctl set /CP/CP_LOG_LEVEL $CAPCOM_LOG_LEVEL
etcdctl set /CP/CP_LOG_LOCATION $CAPCOM_LOG_LOCATION
etcdctl set /CP/CP_PORT 2002
etcdctl set /CP/CP_PROXY haproxy
etcdctl set /CP/CP_PROXY_CONFIG_FILE /etc/haproxy/haproxy.cfg
etcdctl set /CP/CP_PROXY_ENABLED true
etcdctl set /CP/CP_PROXY_RESTART_SCRIPT /restart_haproxy.sh
etcdctl set /CP/CP_PROXY_TIMEOUT 45000