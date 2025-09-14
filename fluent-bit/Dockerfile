FROM fluent/fluent-bit:4.0.9-arm64

# Конфиги будут монтироваться через map
# Fluent Bit запускается напрямую с конфигом
CMD ["/fluent-bit/bin/fluent-bit", "-c", "/data/fluent-bit.conf"]
