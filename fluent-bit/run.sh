#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

LOG_LEVEL=$(jq -r '.log_level' $CONFIG_PATH)
OUTPUT=$(jq -r '.output' $CONFIG_PATH)
PARSERS=$(jq -r '.parsers' $CONFIG_PATH)

# Создаём конфиги
cat > /data/fluent-bit.conf <<EOF
[SERVICE]
    Flush        1
    Daemon       Off
    Log_Level    ${LOG_LEVEL}
    Parsers_File /data/parsers.conf

[INPUT]
    Name   tail
    Path   /config/home-assistant.log
    Tag    hass
    Parser json
    DB     /data/flb_hass.db

[INPUT]
    Name   tail
    Path   /data/supervisor/home-assistant.log
    Tag    supervisor
    Parser json
    DB     /data/flb_supervisor.db

${OUTPUT}
EOF

echo "${PARSERS}" > /data/parsers.conf

echo "[INFO] Starting Fluent Bit with log level: ${LOG_LEVEL}"
exec /usr/local/fluent-bit/bin/fluent-bit -c /data/fluent-bit.conf
