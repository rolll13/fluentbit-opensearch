# Берём официальный Fluent Bit для ARM64
FROM fluent/fluent-bit:4.0.9-arm64

# Копируем скрипт запуска
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Fluent Bit конфиги будут монтироваться через map
CMD ["/run.sh"]
