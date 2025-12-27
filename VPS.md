# 🚀 Ultimate VPS Deployment & Security Guide

This guide serves as a comprehensive reference for setting up, securing, and deploying applications on a Virtual Private Server (VPS). 

## 📋 Table of Contents
1. [Initial Access & User Management](#1-initial-access--user-management)
2. [System Security & Firewall](#2-system-security--firewall)
3. [Environment Setup (Docker & Tools)](#3-environment-setup-docker--tools)
4. [Project Deployment](#4-project-deployment)
5. [SSL & Domain Configuration](#5-ssl--domain-configuration)
6. [Maintenance & Monitoring](#6-maintenance--monitoring)
7. [Database Management](#7-database-management)
8. [Utilities & Secrets](#8-utilities--secrets)

---

## 1. Initial Access & User Management

### 🔑 Root Login
Connect to your server using the root credentials provided by your VPS provider.
```bash
ssh root@YOUR_SERVER_IP
```

### 👤 Create New Sudo User
**Security Best Practice:** Never run your server as root. Create a dedicated user.

```bash
# 1. Create a new user
sudo adduser newuser

# 2. Add user to sudo group
sudo usermod -aG sudo newuser

# 3. Verify permissions
sudo -l -U newuser

# 4. Check user ID
id newuser
```

### 🔄 Switch User
Log out and log back in as the new user.
```bash
# Logout from root
exit

# Login as new user
ssh newuser@YOUR_IP
```

---

## 2. System Security & Firewall

### 🛡️ Update System
Ensure all existing packages are up to date.
```bash
sudo apt update && sudo apt upgrade -y
```

### 🧱 Configure Firewall (UFW)
Set up a firewall to only allow necessary traffic.

```bash
# 1. Deny all incoming traffic by default
sudo ufw default deny incoming

# 2. Allow essential ports
sudo ufw allow 22/tcp        # SSH
sudo ufw allow 80/tcp        # HTTP
sudo ufw allow 443/tcp       # HTTPS
sudo ufw allow 5433/tcp      # Custom Postgres Port (if needed externally)

# 3. Enable firewall
sudo ufw enable

# 4. Check status
sudo ufw status verbose
```

### 🚫 Fail2Ban (Brute Force Protection)
Protect SSH and Web Server from massive login attempts.

```bash
# 1. Install Fail2Ban
sudo apt install fail2ban -y

# 2. Create configuration file
sudo nano /etc/fail2ban/jail.local
```

**Paste the following configuration:**
```ini
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
logpath = /var/log/nginx/error.log
maxretry = 5

[nginx-limit-req]
enabled = true
port = http,https
logpath = /var/log/nginx/error.log
maxretry = 5

```

**Start Fail2Ban Service:**
```bash
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
sudo fail2ban-client status
```

---

## 3. Environment Setup (Docker & Tools)

### 🐳 Install Docker & Docker Compose
```bash
# Install Docker
sudo apt install docker.io -y

# Install Docker Compose
sudo apt install docker compose -y

# Add your user to Docker group (avoids using sudo for docker commands)
sudo usermod -aG docker $USER
# OR specific user
# sudo usermod -aG docker go

# Verify installation
docker --version
docker-compose --version
```

### 🛠️ Install aaPanel (Optional Management Interface)
If you prefer a web-based management tool:
```bash
URL=https://www.aapanel.com/script/install_pro_en.sh && if [ -f /usr/bin/curl ];then curl -ksSO $URL ;else wget --no-check-certificate -O install_pro_en.sh $URL;fi;bash install_pro_en.sh aa372544
```
*Note: Save the login credentials provided at the end of installation.*

---

## 4. Project Deployment

### 📥 Clone Repository
```bash
git clone https://github.com/your-repo/your-project.git
cd your-project
```

### ⚙️ Configuration (.env)
Setup your environment variables.
```bash
cp .env.example .env
nano .env
```
*Tip: Ensure `DEBUG=False` and set strong passwords in production.*

### 🚀 Docker Operations

**Build and Start:**
```bash
# Build images (force recreation)
docker compose build --no-cache

# Run containers in background
docker compose up -d
```

**Stop and Clean:**
```bash
# Stop containers
docker compose down

# Stop and remove volumes (WARNING: Deletes Database Data)
docker compose down --volumes

# Show runnning configuration
docker compose config
```

---

## 5. SSL & Domain Configuration

### 🔒 Generate SSL Certificate (Certbot)
Replace `email` and `domain` with your details.

```bash
# Request Certificate
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

### 🔧 Fix Permissions
Ensure Nginx and Certbot can read the certificates.
```bash
# Set folder permissions (755)
sudo docker run --rm -v certbot_certs:/etc/letsencrypt \
  alpine chmod -R 755 /etc/letsencrypt/live/

# Set file permissions (644)
sudo docker run --rm -v certbot_certs:/etc/letsencrypt \
  alpine chmod 644 /etc/letsencrypt/live/summary.osmbeta.cloud/*
```

### 📅 Auto-Renewal Setup
Add a cron job to check and renew certificates automatically.

```bash
# Open crontab
crontab -e

# Add the following line (Runs daily at midnight)
0 0 * * * docker run --rm -v certbot_certs:/etc/letsencrypt -p 80:80 certbot/certbot renew --standalone --quiet && docker restart nginx_reverse_proxy
```

### ✅ Verify SSL
```bash
# Check certificate files
sudo docker run --rm -v certbot_certs:/etc/nginx/ssl \
  alpine ls -l /etc/nginx/ssl/live/summary.osmbeta.cloud/

# Advanced security check
sudo apt install testssl.sh -y
testssl.sh https://summary.osmbeta.cloud
```

---

## 6. Maintenance & Monitoring

### 🧹 System Cleanup (Space Saver)
Commands to free up disk space.
```bash
# Remove unused Docker resources
docker system prune -a --volumes

# check space used by docker
sudo docker system df

# Clean apt cache
sudo apt autoremove -y && sudo apt clean
```

### 📦 Backup Script
Create `~/backup.sh` for automated backups.

```bash
#!/bin/bash
BACKUP_DIR="/home/go/backups"
DATE=$(date +%Y%m%d_%H%M%S)

mkdir -p $BACKUP_DIR
echo "Starting backup at $(date)"

# 1. Database
sudo docker exec postgres_db pg_dump -U taha summary > $BACKUP_DIR/db_backup_$DATE.sql

# 2. Media Files
sudo docker run --rm -v summary_media_volume:/data -v $BACKUP_DIR:/backup alpine tar czf /backup/media_backup_$DATE.tar.gz -C /data .

# 3. Clean old backups (>30 days)
find $BACKUP_DIR -name "*.sql" -mtime +30 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +30 -delete

echo "Backup completed."
```
**Schedule Backup:** `0 2 * * * /home/user/backup.sh >> /home/user/backup.log 2>&1`

### 📊 Monitoring Script
Create `~/monitor.sh` to check health status.

```bash
#!/bin/bash
echo "=== System Health Check $(date) ==="
# Containers
sudo docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
# Disk
df -h | grep -E "Filesystem|/dev/"
# Memory
free -h
# Logs
sudo docker logs nginx_reverse_proxy 2>&1 | tail -5
sudo docker logs backend 2>&1 | tail -5
```

---

## 7. Database Management

### 🐘 Access Postgres Shell
```bash
# Connect to container
sudo docker exec -it postgres_db bash

# OR Connect direct to DB
sudo docker exec -it containerName psql -U userName -d databaseName
```

### 🔑 Change DB Password
```sql
ALTER USER userName WITH PASSWORD 'newPassword';
```

---

## 8. Utilities & Secrets

### 🔐 Generate Django Secret Key
```bash
python -c "import secrets; print(secrets.token_urlsafe(50))"
# OR via Django Admin
django-admin shell -c "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
```

### 🔑 Generate JWT Secret Key
```bash
python - <<EOF
import secrets
print(secrets.token_hex(64))
EOF
```

### 🛡️ Recommended Security Headers (Django)
Add these to your `settings.py`:
```python
SECURE_BROWSER_XSS_FILTER = True
SECURE_CONTENT_TYPE_NOSNIFF = True
X_FRAME_OPTIONS = 'DENY'
SECURE_SSL_REDIRECT = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SECURE = True
SECURE_HSTS_SECONDS = 31536000
SECURE_HSTS_INCLUDE_SUBDOMAINS = True
SECURE_HSTS_PRELOAD = True
```