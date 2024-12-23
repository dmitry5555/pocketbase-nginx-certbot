FROM nginx:latest

# Установка certbot
RUN apt-get update && apt-get install -y certbot python3-certbot-nginx

# Копирование скриптов и конфигов
COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
COPY renew-cert.sh /renew-cert.sh

# Выдаем права на выполнение
RUN chmod +x /entrypoint.sh /renew-cert.sh

# Создаем директории
RUN mkdir -p /var/www/certbot /etc/letsencrypt

# Устанавливаем точку входа
ENTRYPOINT ["/entrypoint.sh"]