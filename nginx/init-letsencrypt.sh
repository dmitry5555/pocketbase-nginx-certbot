#!/bin/bash

# Домен и email для Let's Encrypt
DOMAIN="db.peth.one"
EMAIL="mikrolux@gmail.com"

# Путь к сертификатам
CERT_PATH="/etc/letsencrypt/live/$DOMAIN"

# Генерация/обновление сертификата
if [ -d "$CERT_PATH" ]; then
  echo "Сертификаты уже существуют. Проверяем необходимость обновления..."
  certbot renew --nginx --quiet
else
  echo "Сертификаты не найдены. Генерируем новые..."
  certbot --nginx --non-interactive --agree-tos --email $EMAIL -d $DOMAIN
fi

echo "Сертификаты успешно обработаны!"