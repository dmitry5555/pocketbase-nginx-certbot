#!/bin/bash

DOMAIN="db.peth.one"
EMAIL="mikrolux@gmail.com"

CERT_PATH="/etc/letsencrypt/live/$DOMAIN"

if [ -d "$CERT_PATH" ]; then
  echo "cert found... checking for renew"
  certbot renew --nginx --quiet
else
  echo "cert not found... making new"
  certbot --nginx --non-interactive --agree-tos --email $EMAIL -d $DOMAIN
fi

echo "cert done!"