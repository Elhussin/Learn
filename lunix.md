# List all EFI boot entries
```bash
sudo efibootmgr
```

# Set the default boot entry
```bash
sudo efibootmgr -o 0000
```

# Remove an EFI boot entry
```bash
sudo efibootmgr -b 0000 -B
```

# Add a new EFI boot entry
```bash
sudo efibootmgr -c -d /dev/sda -p 1 -L "Windows Boot Manager" -l \EFI\Microsoft\Boot\bootmgfw.efi
```

# Set the default boot entry
```bash
sudo efibootmgr -o 0003,0000
```

# Install GRUB to the EFI partition
```bash
sudo mount /dev/sdX2 /mnt   # replace sdX2 with your EFI partition (HD(2,GPT,...))
sudo grub-install --target=x86_64-efi --efi-directory=/mnt --bootloader-id=ubuntu --recheck
sudo update-grub
```

# add windserf
```bash
sudo apt-get install wget gpg
wget -qO- "https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/windsurf.gpg" | gpg --dearmor > windsurf-stable.gpg
sudo install -D -o root -g root -m 644 windsurf-stable.gpg /etc/apt/keyrings/windsurf-stable.gpg
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/windsurf-stable.gpg] https://windsurf-stable.codeiumdata.com/wVxQEIWkwPUEAGf3/apt stable main" | sudo tee /etc/apt/sources.list.d/windsurf.list > /dev/null
rm -f windsurf-stable.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install windsurf
```
# install git
```bash
sudo apt install git
```



# install python3
```bash
sudo apt install python3
```

# install pip
```bash
sudo apt install python3-pip
```

# install curl
```bash
sudo apt install curl
```

# Install Bun
```bash
curl -fsSL https://bun.sh/install | bash # for macOS, Linux, and WSL
```
install postgresql
```bash
sudo apt install postgresql postgresql-contrib
```


<!-- install pgadmin4 -->

# install pgadmin4
```bash
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

sudo apt install pgadmin4
```
# start postgressql
```bash
sudo systemctl start postgresql
sudo systemctl enable postgresql
```

# create user
```bash
sudo -u postgres psql
CREATE USER taha WITH PASSWORD '3112';
GRANT ALL PRIVILEGES ON DATABASE optics_tenant TO postgres;
\q
psql -U taha -d optics_tenant
```

# restart postgressql
```bash
sudo systemctl restart postgresql.service
sudo systemctl start postgresql.service


# grant permissions
sudo -u postgres psql -d optics_tenant -c "GRANT ALL PRIVILEGES ON SCHEMA public TO taha; GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO taha; GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO taha; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO taha; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO taha;"

# grant permissions to user
sudo -u postgres psql -d optics_tenant -c "GRANT ALL PRIVILEGES ON SCHEMA public TO taha; GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO taha; GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO taha; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO taha; ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON SEQUENCES TO taha;"



# install docker
```bash
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```
```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
# start docker
```bash
sudo systemctl status docker
sudo systemctl start docker
```
# stop docker
```bash
sudo systemctl stop docker
```
# start docker
```bash
sudo docker-compose down -v

```

# start docker compose
```bash
sudo docker-compose up --build -d

docker compose -f docker-compose.dev.yml up

```

# install docker-compose
```bash
sudo apt-get update
sudo apt-get install docker-compose-plugin
```

# remove all docker containers
```bash
docker-compose down -v --remove-orphans
docker system prune -af
```
# start docker compose without rebuild
docker-compose up -d


# stop docker compose
docker-compose down

# stop docker compose with volumes
docker-compose down -v
