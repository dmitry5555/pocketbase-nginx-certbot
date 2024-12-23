#!/bin/bash

# Тихое обновление сертификата
certbot renew --quiet --nginx

# Перезагрузка nginx
nginx -s reload