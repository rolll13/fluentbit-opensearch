FROM fluent/fluent-bit:2.2.7-arm64

# Копируем скрипт запуска
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Fluent Bit конфиги будут монтироваться через map
CMD ["/run.sh"]
