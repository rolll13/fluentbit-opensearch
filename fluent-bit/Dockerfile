ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:14.0.2
FROM ${BUILD_FROM}

# Версия Fluent Bit
ENV FLB_VERSION=4.0.9

# Устанавливаем зависимости и jq
RUN apk add --no-cache curl jq libc6-compat

# Скачиваем Fluent Bit
RUN curl -L https://github.com/fluent/fluent-bit/releases/download/v${FLB_VERSION}/fluent-bit-${FLB_VERSION}-linux-arm64.tar.gz \
    | tar -xz -C /usr/local/ \
 && mv /usr/local/fluent-bit-${FLB_VERSION}-linux-arm64 /usr/local/fluent-bit

# Копируем стартовый скрипт
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Рабочая директория
WORKDIR /usr/local/fluent-bit

CMD ["/run.sh"]
