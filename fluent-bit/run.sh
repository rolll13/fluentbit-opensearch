#!/usr/bin/env bash

# Запускаем Fluent Bit с конфигом, смонтированным через map
/fluent-bit/bin/fluent-bit -c /data/fluent-bit.conf
