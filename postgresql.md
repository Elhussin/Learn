### install postgresql
```bash
sudo apt update
sudo apt install postgresql postgresql-contrib
```


### create user
```bash
sudo -u postgres psql
CREATE USER <username> WITH PASSWORD '<password>';
```

### check status
```bash
sudo systemctl status postgresql
```

### Switch to PostgreSQL user
```bash
sudo -i -u postgres
psql  # to enter the PostgreSQL command line interface
```

### enable postgresql
```bash
sudo systemctl enable postgresql
```

### create database
```bash
sudo -u postgres psql
CREATE DATABASE optics_tenant;
CREATE USER taha1 WITH ENCRYPTED PASSWORD '3112';

ALTER ROLE taha1 SET client_encoding TO 'utf8';
ALTER ROLE taha1 SET default_transaction_isolation TO 'read committed';
ALTER ROLE taha1 SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE optics_tenant TO taha1;
\q
```

### windows\
```bash
createdb optics
```

### create user
```bash
createuser -P -s taha
```

### grant permissions
```bash
psql
GRANT ALL PRIVILEGES ON DATABASE optics TO taha;
\q
```
### connect to database
```bash
psql -U postgres -d optics_tenant
```
### grant permissions
```bash
GRANT USAGE ON SCHEMA public TO taha;
GRANT CREATE ON SCHEMA public TO taha;
GRANT ALL PRIVILEGES ON SCHEMA public TO taha;
```
### grant permissions to user       
```bash
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL ON TABLES TO taha;
```

### pgadmin4
```bash
sudo systemctl status pgadmin4
```

### install pgadmin4
```bash
sudo apt update
sudo apt install pgadmin4
sudo apt install pgadmin4-apache2
```

### run pgadmin4
```bash
sudo systemctl start pgadmin4
sudo systemctl enable pgadmin4
```
