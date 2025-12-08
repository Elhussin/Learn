# VPS
## access root
## 
```bash
ssh root@YOUR_IP
```

## close connection
```bash
exit

Ctrl + D
```

### 🔒 المرحلة 1: التجهيز والأمان على الـ VPS
تأكد من أن خادمك مؤمن ومجهز لاستقبال التطبيق.

1. تأمين الاتصال الأساسي
إنشاء مستخدم جديد (غير Root): لا تقم بتسجيل الدخول أو تشغيل Docker أو أي خدمة بصلاحيات root. أنشئ مستخدماً جديداً بصلاحيات sudo.


# creat new user
sudo adduser newuser
# add user to sudo group
sudo usermod -aG sudo newuser

check user permission
```bash
sudo -l -U newuser
```
# check user
id newuser

# login as new user
ssh newuser@YOUR_IP



## update system
```bash
apt update && apt upgrade -y
```

## install docker
```bash
apt install docker.io -y
```

# جدار حماية firewall

```bash
sudo ufw default deny incoming
sudo ufw allow 22/tcp
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable
sudo ufw allow 5433/tcp # for postgres 

```
<!-- التحقق من حالة ufw -->
# check ufw status
```bash
sudo ufw status
```
## check ufw status verbose
```bash
sudo ufw status verbose
```

## install docker-compose
```bash
apt install docker-compose -y
```

 ## check docker version
```bash
docker --version
docker-compose --version
```

<!-- تثبيت aapanal -->
# install aapanal  to access from web
```bash
URL=https://www.aapanel.com/script/install_pro_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO $URL ;else wget --no-check-certificate -O install_pro_en.sh $URL;fi;bash install_pro_en.sh aa372544
```

## aaPanel Internet Address
```bash
https://72.62.57.24:40243/0519ef47
```


## dowcloud project
```bash
git clone https://github.com/your-repo/your-project.git

```
## Add environment variables for frontend and backend
```bash
cp .env.example .env
```



## install project
```bash
docker compose build --no-cache
```

## run project
```bash
docker compose up -d
```

## stop project
```bash
docker compose down
```

## remove project
```bash
docker compose down --volumes
```


### add ssl to project

```bash
docker run -it --rm \
  -v certbot_config:/etc/letsencrypt \
  -v certbot_certs:/etc/nginx/ssl \
  -p 80:80 \
  certbot/certbot certonly --standalone \
  -d summary.osmbeta.cloud \
  --email hasin3112@gmail.com \
  --agree-tos \
  --non-interactive
```

docker run --rm \
  -v certbot_certs:/etc/letsencrypt/live \
  -v certbot_config:/etc/letsencrypt \
  certbot/certbot certonly --standalone \
  -d summary.osmbeta.cloud --email hasin3112@gmail.com --agree-tos --non-interactive


### check ssl
```bash
sudo docker run --rm -v summary_certbot_certs:/etc/nginx/ssl \
  alpine ls -l /etc/nginx/ssl/live/summary.osmbeta.cloud/
```


##
```
# نستخدم -v certbot_certs:/etc/letsencrypt للوصول إلى الوحدة الصحيحة
# chmod -R 755 للمجلدات (rwx r-x r-x)
sudo docker run --rm -v certbot_certs:/etc/letsencrypt \
  alpine chmod -R 755 /etc/letsencrypt/live/
  
# chmod 644 لملفات pem داخل المجلد (rw- r-- r--)
sudo docker run --rm -v certbot_certs:/etc/letsencrypt \
  alpine chmod 644 /etc/letsencrypt/live/summary.osmbeta.cloud/*
  ```

# هذا الأمر يحاول تجديد الشهادة كل يوم في منتصف الليل
```bash
0 0 * * * docker run -v certbot_config:/etc/letsencrypt -v certbot_certs:/etc/nginx/ssl certbot/certbot renew --quiet && docker exec nginx_reverse_proxy nginx -s reload
```
## add ssl to project
```bash

```

may domai 
```bash
osmbeta.cloud
```




#2. Fail2Ban (حماية من هجمات Brute Force)
# تثبيت fail2ban
sudo apt update
sudo apt install fail2ban -y

# إنشاء ملف إعدادات مخصص
sudo nano /etc/fail2ban/jail.local

# إضافة إعدادات
```bash
[DEFAULT]
bantime = 1h
findtime = 10m
maxretry = 5
ignoreip = 127.0.0.1/8

[sshd]
enabled = true
port = 22

[nginx-http-auth]
enabled = true
port = http,https

[nginx-limit-req]
enabled = true
port = http,https
```

## تفعيل fail2ban
```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo fail2ban-client status
```

## إضافة هذه الإعدادات
```bash
SECURE_BROWSER_XSS_FILTER=True
SECURE_CONTENT_TYPE_NOSNIFF=True
X_FRAME_OPTIONS=DENY
SECURE_SSL_REDIRECT=True
SESSION_COOKIE_SECURE=True
CSRF_COOKIE_SECURE=True
SECURE_HSTS_SECONDS=31536000
SECURE_HSTS_INCLUDE_SUBDOMAINS=True
SECURE_HSTS_PRELOAD=True
```




## backup


```bash
#!/bin/bash

# النسخ الاحتياطي التلقائي
BACKUP_DIR="/home/go/backups"
DATE=$(date +%Y%m%d_%H%M%S)

# إنشاء مجلد النسخ الاحتياطي
mkdir -p $BACKUP_DIR

echo "Starting backup at $(date)"

# نسخ احتياطي لقاعدة البيانات
echo "Backing up database..."
sudo docker exec postgres_db pg_dump -U taha summary > $BACKUP_DIR/db_backup_$DATE.sql

# نسخ احتياطي للملفات المرفوعة
echo "Backing up media files..."
sudo docker run --rm -v summary_media_volume:/data -v $BACKUP_DIR:/backup alpine tar czf /backup/media_backup_$DATE.tar.gz -C /data .

# نسخ احتياطي للشهادات
echo "Backing up SSL certificates..."
sudo docker run --rm -v certbot_certs:/data -v $BACKUP_DIR:/backup alpine tar czf /backup/certs_backup_$DATE.tar.gz -C /data .

# حذف النسخ الاحتياطية الأقدم من 30 يوم
echo "Cleaning old backups..."
find $BACKUP_DIR -name "*.sql" -mtime +30 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +30 -delete

echo "Backup completed at $(date)"
echo "Backup files:"
ls -lh $BACKUP_DIR/*_$DATE*
```

## 
```bash
#!/bin/bash

# مراقبة حالة الحاويات
check_containers() {
    echo "=== Container Status ==="
    sudo docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
    echo ""
}

# مراقبة استخدام القرص
check_disk() {
    echo "=== Disk Usage ==="
    df -h | grep -E "Filesystem|/dev/"
    echo ""
}

# مراقبة استخدام الذاكرة
check_memory() {
    echo "=== Memory Usage ==="
    free -h
    echo ""
}

# مراقبة شهادة SSL
check_ssl() {
    echo "=== SSL Certificate Expiry ==="
    echo | openssl s_client -servername summary.osmbeta.cloud -connect summary.osmbeta.cloud:443 2>/dev/null | openssl x509 -noout -dates
    echo ""
}

# مراقبة اللوقات الأخيرة
check_logs() {
    echo "=== Recent Errors ==="
    sudo docker logs nginx_reverse_proxy 2>&1 | grep -i error | tail -5
    sudo docker logs backend 2>&1 | grep -i error | tail -5
    echo ""
}

# تشغيل جميع الفحوصات
echo "Starting system monitoring at $(date)"
echo "========================================"
check_containers
check_disk
check_memory
check_ssl
check_logs
echo "========================================"
echo "Monitoring completed at $(date)"

```
# add user to docker group
```bash
#sudo usermod -aG docker $USER
sudo usermod -aG docker go
```

## add file
```bash
# 1. تحديث nginx.conf
cd ~/summary
nano nginx/nginx.conf  # انسخ المحتوى من الـ artifact

# 2. إنشاء سكريبت النسخ الاحتياطي
nano ~/backup.sh  # انسخ المحتوى من الـ artifact
chmod +x ~/backup.sh
ls -l ~/backup.sh  # تحقق من الصلاحيات
bash ~/backup.sh  # اختبر النسخ الاحتياطي



# 3. إنشاء سكريبت المراقبة
nano ~/monitor.sh  # انسخ المحتوى من الـ artifact
chmod +x ~/monitor.sh

# 4. جدولة النسخ الاحتياطي (كل يوم الساعة 2 صباحاً)
crontab -e
# أضف هذا السطر:
0 2 * * * /home/go/backup.sh >> /home/go/backup.log 2>&1

# 5. إعادة تشغيل nginx
sudo docker-compose restart nginx

# 6. اختبار المراقبة
./monitor.sh

```

## تحديثات امنية
```bash
# إنشاء سكريبت للتحديثات
cat > ~/update-system.sh << 'EOF'
#!/bin/bash
echo "Updating system packages..."
sudo apt update
sudo apt upgrade -y
sudo apt autoremove -y

echo "Updating Docker images..."
cd ~/summary
sudo docker-compose pull
sudo docker-compose up -d --build

echo "System update completed!"
EOF

chmod +x ~/update-system.sh


```

## test
```bash
# اختبر الموقع
curl -I https://summary.osmbeta.cloud

# فحص أمان SSL
sudo apt install testssl.sh -y
testssl.sh https://summary.osmbeta.cloud
```


#renew ssl
```bash
crontab -e

0 0 * * * docker run --rm -v certbot_certs:/etc/letsencrypt -p 80:80 certbot/certbot renew --standalone --quiet && docker restart nginx_reverse_proxy

```

# clear
## clean docker old images
```bash
docker system prune -a  # remove all unused images, containers, networks, and volumes
docker volume prune -a  # remove all unused volumes
docker network prune -a  # remove all unused networks
docker container prune -a  # remove all unused containers
docker image prune -a  # remove all unused images
docker system prune -a --volumes  # remove all unused images, containers, networks, and volumes

```

  check used
```bash
sudo docker system df
```

# clean system
```bash
sudo apt autoremove -y
sudo apt clean
sudo apt update
sudo apt clean        # يمسح ملفات الحزم المؤقتة من apt
sudo apt autoclean    # يمسح الحزم القديمة الغير قابلة للتنزيل
sudo apt autoremove   # يحذف الحزم غير المستخدمة والمثبتة كاعتمادات


```


## postgres
```bash
sudo docker exec -it postgres_db bash
#or
sudo docker exec -it containerName psql -U userName -d databaseName


```

change password
```bash
ALTER USER userName WITH PASSWORD 'newPassword';
```


# django screat key 
```bash
python -c "import secrets; print(secrets.token_urlsafe(50))"

#or 

django-admin shell -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"

```

# jwt secret key
```bash
python - <<EOF
import secrets
print(secrets.token_hex(64))
EOF
```

# show config
```bash
sudo docker compose config
```