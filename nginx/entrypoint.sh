#!/bin/bash

# Параметры для замены
DOMAIN=${DOMAIN:-db.peth.one}
EMAIL=${EMAIL:-mikrolux@gmail.com}

# Генерация базовой конфигурации nginx
cat > /etc/nginx/conf.d/default.conf <<EOF
server {
    listen 80;
    server_name $DOMAIN;
    
    location /.well-known/acme-challenge/ {
        root /var/www/certbot;
    }

    location / {
        return 301 https://\$host\$request_uri;
    }
}
EOF

# Получение сертификата
certbot certonly --standalone \
    -d $DOMAIN \
    -m $EMAIL \
    --agree-tos \
    --no-eff-email \
    --force-renewal

# Генерация SSL конфигурации
cat > /etc/nginx/conf.d/ssl.conf <<EOF
server {
    listen 443 ssl;
    server_name $DOMAIN;

    ssl_certificate /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;

    # Базовые SSL настройки
    ssl_protocols TLSv1.2 TLSv1.3;
    ssl_prefer_server_ciphers on;
    ssl_ciphers HIGH:!aNULL:!MD5;

    location / {
        # Ваш основной контент
        root /usr/share/nginx/html;
        index index.html;
    }
}
EOF

# Запуск cron для автообновления сертификатов
# Запускаем каждые 12 часов
(crontab -l 2>/dev/null; echo "0 */12 * * * /renew-cert.sh") | crontab -

# Запуск nginx
nginx -g "daemon off;"