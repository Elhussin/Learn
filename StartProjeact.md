# Crate projeact first step
```bash
mkdir tenant_project
cd tenant_project
python -m venv venv
source venv/bin/activate  # أو venv\Scripts\activate في Windows
```
### install dependencies
```bash
pip install django djangorestframework psycopg2-binary django-tenants
```

### create project
```bash     
django-admin startproject optics_tenant
```

### create app
```bash
python manage.py startapp customers
python manage.py startapp orders
python manage.py startapp core
python manage.py startapp accounts
```

### create database
```bash
CREATE DATABASE tenant_db;
CREATE USER tenant_user WITH PASSWORD 'tenant_pass';
GRANT ALL PRIVILEGES ON DATABASE tenant_db TO tenant_user;
```

### create .env file
```bash
SECRET_KEY = <secret_key>
DEBUG=True

DB_NAME=db_name
DB_USER=db_user
DB_PASSWORD=db_password
DB_HOST=db_host
DB_PORT=db_port
```

### email
```bash
EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'your_email@gmail.com'
EMAIL_HOST_PASSWORD = 'your_email_password'
```

### Add settings to project
```bash
optics_tenant/settings.py
```
> add database settings
```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config('DB_NAME'),
        'USER': config('DB_USER'),
        'PASSWORD': config('DB_PASSWORD'),
        'HOST': config('DB_HOST', default='localhost'),
        'PORT': config('DB_PORT', default='5432'),
    }
}
```
> add installed apps
```bash
INSTALLED_APPS = [
    'django_tenants',
    'customers',
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
]
```
> add middleware


python manage.py makemigrations customers
python manage.py migrate_schemas --shared


### create tenant
```
python manage.py shell
from customers.models import Client, Domain

# إنشاء العميل (Tenant)
tenant = Client(
    schema_name='store1',           # اسم السكيما لهذا العميل (يظهر في Postgres)
    name='Solo Vision Store 1',     # اسم العميل (اختياري)
    paid_until='2030-01-01',
    on_trial=True,
)
tenant.save()  # هذا سينشئ السكيما store1 تلقائيًا

# ربط الدومين الفرعي بالسكيما
domain = Domain()
domain.domain = 'store1.localhost'  # مثل store1.yourdomain.com
domain.tenant = tenant
domain.is_primary = True
domain.save()
```



```bash
python manage.py makemigrations core orders
python manage.py migrate_schemas --tenant
```