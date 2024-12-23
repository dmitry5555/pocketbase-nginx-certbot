# Используем официальный образ Nginx
FROM nginx:alpine

# Устанавливаем certbot для автоматического получения сертификатов
RUN apk add --no-cache certbot bash

# Копируем конфигурацию Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Рабочая директория
WORKDIR /etc/letsencrypt

# Создаем директорию для веб-сайта
VOLUME ["/etc/letsencrypt", "/var/www/certbot"]

# Открываем порты для HTTP и HTTPS
EXPOSE 80 443
