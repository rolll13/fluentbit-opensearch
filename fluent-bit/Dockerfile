ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:14.0.2
FROM ${BUILD_FROM}

ENV FLB_VERSION=4.0.9

# Устанавливаем зависимости и jq
RUN apk add --no-cache curl jq xz libc6-compat

# Скачиваем Fluent Bit (правильный архив .tar.xz)
RUN curl -L https://github.com/fluent/fluent-bit/releases/download/v${FLB_VERSION}/fluent-bit-${FLB_VERSION}-arm64.tar.xz \
    | tar -xJ -C /usr/local/ \
 && mv /usr/local/fluent-bit-${FLB_VERSION} /usr/local/fluent-bit

# Копируем стартовый скрипт
COPY run.sh /run.sh
RUN chmod +x /run.sh

WORKDIR /usr/local/fluent-bit

CMD ["/run.sh"]
