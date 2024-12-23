#!/bin/bash

# Параметры для замены
DOMAIN=${DOMAIN:-db.peth.one}
EMAIL=${EMAIL:-mikrolux@gmail.com}

# Получение сертификата
certbot certonly --standalone \
    -d $DOMAIN \
    -m $EMAIL \
    --agree-tos \
    --no-eff-email \
    --force-renewal

# Запуск cron для автообновления сертификатов
# Запускаем каждые 12 часов
(crontab -l 2>/dev/null; echo "0 */12 * * * /renew-cert.sh") | crontab -

# Запуск nginx
nginx -g "daemon off;"