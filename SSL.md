# run nginx
 ```bash
 docker-compose up -d nginx
 ```

<!-- Important: replace YOUR_DOMAIN.com with your domain -->
# run certbot
 ```bash
docker run --rm -it \
  -v $(pwd)/certbot/conf:/etc/letsencrypt \
  -v $(pwd)/certbot/www:/var/www/certbot \
  certbot/certbot certonly \
  --webroot \
  --webroot-path=/var/www/certbot \
  -d YOUR_DOMAIN.com -d www.YOUR_DOMAIN.com
```
# auto renew certbot
 ```bash
0 2 * * * docker-compose run --rm certbot renew && docker-compose restart nginx
```
