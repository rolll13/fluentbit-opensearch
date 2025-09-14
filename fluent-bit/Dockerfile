ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:14.0.2
FROM ${BUILD_FROM}

# Устанавливаем fluent-bit и jq
RUN apk add --no-cache fluent-bit jq

# Копируем стартовый скрипт
COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
