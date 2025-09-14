#!/usr/bin/env bash
set -e

CONFIG_PATH=/data/options.json

# читаем значения из options.json
LOG_LEVEL=$(jq -r '.log_level' $CONFIG_PATH)
OUTPUT=$(jq -r '.output' $CONFIG_PATH)
PARSERS=$(jq -r '.parsers' $CONFIG_PATH)

# генерируем fluent-bit.conf
cat > /data/fluent-bit.conf <<EOF
[SERVICE]
    Flush        5
    Daemon       Off
    Log_Level    ${LOG_LEVEL}
    Parsers_File /data/parsers.conf

[INPUT]
    Name tail
    Path /config/home-assistant.log
    Parser docker
    Tag homeassistant

[INPUT]
    Name tail
    Path /data/supervisor/home-assistant.log
    Parser docker
    Tag supervisor

${OUTPUT}
EOF

# генерируем parsers.conf
echo "${PARSERS}" > /data/parsers.conf

# запускаем Fluent Bit
exec /usr/bin/fluent-bit -c /data/fluent-bit.conf
