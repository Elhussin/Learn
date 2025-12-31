# Linux Administration & Development Guide

A comprehensive reference for system administration, boot management, and development environment setup on Linux (Ubuntu/Debian).

---

## 🖥️ System & Boot Management

### EFI Boot Manager (`efibootmgr`)
Used to manage boot entries (useful for fixing dual-boot issues).

| Action | Command |
| :--- | :--- |
| **List Entries** | `sudo efibootmgr` |
| **Set Default** | `sudo efibootmgr -o 0000` (Sets entry 0000 as default) |
| **Set Order** | `sudo efibootmgr -o 0003,0000` (Boot 0003, then 0000) |
| **Delete Entry** | `sudo efibootmgr -b 0000 -B` |
| **Create Entry** | `sudo efibootmgr -c -d /dev/sda -p 1 -L "Windows" -l \EFI\Microsoft\Boot\bootmgfw.efi` |

### GRUB Repair
Reinstall GRUB to the EFI partition if bootloader is corrupted.
```bash
# 1. Mount EFI partition (Replace /dev/sdX2 with your actual EFI partition)
sudo mount /dev/sdX2 /mnt

# 2. Install GRUB
sudo grub-install --target=x86_64-efi --efi-directory=/mnt --bootloader-id=ubuntu --recheck

# 3. Update Configuration
sudo update-grub
```

---

## 🛠️ Essential Development Tools

### Basic Utilities
```bash
# Update System
sudo apt update && sudo apt upgrade -y

# Install Basics
sudo apt install git curl wget -y
```

### Python
```bash
# Install Python & Pip
sudo apt install python3 python3-pip -y
```

### JavaScript Runtime (Bun)
```bash
curl -fsSL https://bun.sh/install | bash
```

### IDE: Windsurf
```bash
# Add GPG Key
sudo apt-get install wget gpg
wget -qO- "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | gpg --dearmor > windsurf-stable.gpg
sudo install -D -o root -g root -m 644 windsurf-stable.gpg /etc/apt/keyrings/windsurf-stable.gpg
rm -f windsurf-stable.gpg

# Add Repository & Install
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/windsurf-stable.gpg] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
sudo apt update
sudo apt install apt-transport-https windsurf
```

---

## 🐘 PostgreSQL Database

### Installation
```bash
# Install Postgres
sudo apt install postgresql postgresql-contrib -y

# Start & Enable Service
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

### User & Database Management
```bash
# Log in as postgres user
sudo -u postgres psql

# SQL Commands inside shell:
# 1. Create User
CREATE USER myuser WITH PASSWORD 'mypassword';

# 2. Create Database
CREATE DATABASE mydb;

# 3. Grant Permissions
GRANT ALL PRIVILEGES ON DATABASE mydb TO myuser;

# Exit
\q
```

### Granting Schema Permissions (Fixing "Permission Denied")
If a user cannot access tables in `public` schema:
```bash
sudo -u postgres psql -d mydb -c "GRANT ALL PRIVILEGES ON SCHEMA public TO myuser;"
sudo -u postgres psql -d mydb -c "GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO myuser;"
sudo -u postgres psql -d mydb -c "ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO myuser;"
```

### pgAdmin4 (GUI Client)
```bash
# Add Key & Repository
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install
sudo apt install pgadmin4
```

---

## 🐳 Docker & Containerization

### Installation (Official Repo)
```bash
# 1. Set up Docker's apt repository
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# 2. Install Docker Engine & Compose Plugin
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Service Management
```bash
# Check Status
sudo systemctl status docker

# Start/Stop
sudo systemctl start docker
sudo systemctl stop docker
```

### Docker Compose Workflows
*Using the modern `docker compose` (V2) command.*

| Action | Command | Description |
| :--- | :--- | :--- |
| **Start (Detached)** | `docker compose up -d` | Starts containers in background |
| **Rebuild & Start** | `docker compose up --build -d` | Rebuilds images before starting |
| **Stop** | `docker compose down` | Stops and removes containers |
| **Stop & Clean** | `docker compose down -v` | Stops and removes volumes (Reset DBs) |
| **View Logs** | `docker compose logs -f` | Follows log output |
| **Clean System** | `docker system prune -af` | Removes unused data (dangerous) |

### Specific Examples
```bash
# Run specific file
docker compose -f docker-compose.dev.yml up -d

# Clean install (Stop, remove volumes, rebuild)
docker compose down -v --remove-orphans
docker compose up --build -d
```



### Create Script
```bash
nano <script_name>.sh
```

# make script executable
```bash
chmod +x <script_name>.sh
```

# run script
```bash
./<script_name>.sh
```

### Generate Secret Key
```bash
openssl rand -base64 64
```