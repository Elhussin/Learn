sudo apt update
sudo apt install nginx
sudo systemctl status nginx

### install gunicorn
sudo apt install gunicorn

### run gunicorn
gunicorn optics_tenant.wsgi:application --bind 127.0.0.1:8000

### restart nginx
sudo systemctl restart nginx

### create nginx server block
sudo nano /etc/nginx/sites-available/optics_tenant_subdomains.conf

```nginx
server {
    listen 80;
    server_name localhost;
    client_max_body_size 20M;

    access_log /var/log/nginx/optics_tenant_access.log;
    error_log /var/log/nginx/optics_tenant_error.log;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /static/ {
        alias /home/youruser/optics_tenant/static/;
    }

    location /media/ {
        alias /home/youruser/optics_tenant/media/;
    }
}

```

### Sundomin Suport
```nginx
server {
    listen 80;
    server_name ~^(?<tenant>[a-z0-9-]+)\.localhost$;
    client_max_body_size 20M;

    access_log /var/log/nginx/optics_tenant_access.log;
    error_log /var/log/nginx/optics_tenant_error.log;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;  # مهم لـ django-tenants
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

    location /static/ {
        alias /home/youruser/optics_tenant/static/;
    }

    location /media/ {
        alias /home/youruser/optics_tenant/media/;
    }
}

```
sudo ln -s /etc/nginx/sites-available/optics_tenant_subdomains.conf /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx



# SSL
sudo apt update

sudo apt install certbot python3-certbot-nginx
sudo certbot --nginx -d yourdomain.com
# for subdomin
sudo certbot --nginx -d client1.example.com
sudo certbot --nginx -d client2.example.com
sudo nginx -t
sudo systemctl reload nginx
### auto renew
sudo systemctl status certbot.timer

# check port
sudo lsof -i :80
sudo systemctl stop apache2
sudo systemctl disable apache2


cd /home/hussin/Desktop/learning/optics_tenant
source ../venv/bin/activate

gunicorn optics_tenant.wsgi:application --bind 127.0.0.1:8000
