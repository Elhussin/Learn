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
CREATE DATABASE optics;
CREATE USER taha WITH ENCRYPTED PASSWORD '3112';

ALTER ROLE taha SET client_encoding TO 'utf8';
ALTER ROLE taha SET default_transaction_isolation TO 'read committed';
ALTER ROLE taha SET timezone TO 'UTC';
GRANT ALL PRIVILEGES ON DATABASE optics TO taha;
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

