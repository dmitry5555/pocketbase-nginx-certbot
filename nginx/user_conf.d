server {
    # Listen to port 443 on both IPv4 and IPv6.
    listen 443 ssl default_server reuseport;
    listen [::]:443 ssl default_server reuseport;

    # Domain names this server should respond to.
    server_name db.peth.one;

    # Load the certificate files.
    ssl_certificate         /etc/letsencrypt/live/db.peth.one/fullchain.pem;
    ssl_certificate_key     /etc/letsencrypt/live/db.peth.one/privkey.pem;
    ssl_trusted_certificate /etc/letsencrypt/live/db.peth.one/chain.pem;

    # Load the Diffie-Hellman parameter.
    ssl_dhparam /etc/letsencrypt/dhparams/dhparam.pem;

    # return 200 'Let\'s Encrypt certificate successfully installed!';
    # add_header Content-Type text/plain;

	 location / {
        proxy_pass http://pocketbase:8090;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }
}